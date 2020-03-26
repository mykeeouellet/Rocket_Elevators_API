class TextToSpeechController < ApplicationController

require "json"
require "ibm_watson/authenticators"
require "ibm_watson/text_to_speech_v1"
include IBMWatson

  def watson
    # If using IAM
    authenticator = Authenticators::IamAuthenticator.new(
      apikey: ENV["text_to_speech_api_key"]
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
      {
      "text": "Hello world!",
      "accept": "audio/wav",
      "voice": "en-US_AllisonVoice"
      }
    ).result
    audio_file.write(response.result)
    end
  end
end