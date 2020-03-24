class Elevator < ApplicationRecord
    require 'twilio-ruby'

    belongs_to :column

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

end
