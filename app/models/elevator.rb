class Elevator < ApplicationRecord
    
    belongs_to :column

    require 'twilio-ruby'

    # Twilio
    validates :elevator_status, presence: true

    after_save :send_notification if :elevator_status_is_intervention?

    def elevator_status_is_intervention?
        self.elevator_status == "Intervention"
    end

    def send_notification
        account_sid = ENV["TWILIO_ACCOUNT_SID"]
        auth_token = ENV["TWILIO_API_KEY"]
        @client = Twilio::REST::Client.new(account_sid, auth_token)

        @client.messages.create(
        from: '+13022869361',
        to: '+15819953715',
         body: 'The Rocket Team is on his way to your elevator :)!'
    )
    end

    # IBM Watson
    # There are currently XXX elevators deployed in the XXX buildings of your XXX customers
    def watson
        nb_elevators = self.all
        nb_buildings = Building.where(entity_type: "Building") 
        nb_customers = Customer.all 
        request.body = JSON.dump({
            "text" => "There are currently #{nb_elevators} elevators deployed in the #{nb_buildings} buildings of your #{nb_customers} customers."})

        # Currently, XXX elevators are not in Running Status and are being serviced
        nb_not_active_elevators = Elevator.where(e => e.status != 'Active')
        request.body = JSON.dump({
            "text" => "Currently, #{nb_not_active_elevators} elevators are not in Running Status and are being serviced."})
    end
end
# b.each do |building|
# b = building.entity_id
# address = Adress.find_by_id(b)