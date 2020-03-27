class TextToSpeechController < ApplicationController

require "json"
require "ibm_watson/authenticators"
require "ibm_watson/text_to_speech_v1"
include IBMWatson

  module IBMWatson
      def watson
        # If using IAM
        authenticator = IBMWatson::Authenticators::IamAuthenticator.new(
          apikey: ENV["TEXT_TO_SPEECH_API_KEY:"]
        )

        # If you have username & password in your credentials use:
        # authenticator = IBMWatson::Authenticators::BasicAuthenticator.new(
        #   username: "{username}",
        #   password: "{password}"
        # )

        text_to_speech = IBMWatson::TextToSpeechV1.new(
        authenticator: authenticator
        )
        text_to_speech.service_url = "https://api.us-east.text-to-speech.watson.cloud.ibm.com"

        File.open("app/assets/audios/summary.wav", "w+") do |audio_file|
          response = text_to_speech.synthesize(
            {"text": "Hello",
            "accept": "audio/wav",
            "voice": "en-GB_KateVoice"}
          )
          audio_file << response
        end
      end
    end
  end