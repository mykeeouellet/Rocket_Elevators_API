class Elevator < ApplicationRecord
    require 'twilio-ruby'
    require 'slack-ruby-client'

    belongs_to :column

    # Twilio
    # validates :elevator_status, presence: true


    after_save :send_slack_message if :elevator_status_has_changed?
    after_save :send_notification if :elevator_status_is_intervention? == true

    # def elevator_status_is_intervention?
    #     self.elevator_status == "Intervention"
    # end


    def elevator_status_has_changed?
        self.changed? == true
    end

    def send_notification
        puts "===================="
        puts elevator_status_is_intervention?
        puts self.elevator_status
        puts "===================="
        account_sid = ENV["TWILIO_ACCOUNT_SID"]
        auth_token = ENV["TWILIO_API_KEY"]
        @client = Twilio::REST::Client.new(account_sid, auth_token)

        @client.messages.create(
        from: '+13022869361',
        to: '+15819953715',
         body: 'The Rocket Team is on his way to your elevator :)!'
    )

    end

    def send_slack_message
        e = Elevator.find(self.id)
        serialNumber = e.elevator_serial_number
        old_status = previous_changes[:elevator_status][0]
        new_status = e.elevator_status
        text = "Elevator " + (e.id.to_s) + " with serial number " + (serialNumber.to_s) + " changed status from " + (old_status) + " to " + (new_status)
        Slack.configure do |config|
            config.token = ENV['SLACK_ACCESS_TOKEN']
        end

        client = Slack::Web::Client.new

        client.chat_postMessage(channel: '#test', text: text, as_user: true)
    end
end

    # IBM Watson
    # There are currently XXX elevators deployed in the XXX buildings of your XXX customers
    # nb_elevators = Elevator.where(e => e.status != 'Active')
    # nb_buildings = Building.all 
    # nb_customers = Customer.all 
    # request.body = JSON.dump({
    #     "text" => "There are currently #{nb_elevators} elevators deployed in the #{nb_buildings} buildings of your #{nb_customers} customers."})

    # # Currently, XXX elevators are not in Running Status and are being serviced
    # nb_not_active_elevators = Elevator.where(e => e.status != 'Active')
    # request.body = JSON.dump({
    #     "text" => "Currently, #{nb_not_active_elevators} elevators are not in Running Status and are being serviced."})
end

