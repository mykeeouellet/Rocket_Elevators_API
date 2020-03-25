  # IBM WATSON TEXT TO SPEECH SERVICE
  # require "json"
  # require "ibm_watson"
  # require "ibm_watson/authenticators"
  # require "ibm_watson/text_to_speech_v1"
  # include IBMWatson
  
  # # For service instances that use IAM authentication
  # authenticator = Authenticators::IamAuthenticator.new(
  #   apikey: "7eE5N3sDMBq7ctO_YeCdl4fnZReJgEVCPcwxbw8ZD3pn"
  # )
  # # # For service instances that use username and password authentication, use the BasicAuthenticator initialization method 
  # # authenticator = Authenticators::BasicAuthenticator.new(
  # #   username: "{username}",
  # #   password: "{password}"
  # # )
  # text_to_speech = TextToSpeechV1.new(
  #   authenticator: authenticator
  # )
  # text_to_speech.service_url = "https://api.us-east.text-to-speech.watson.cloud.ibm.com/instances/f0cdc9cb-a371-432d-87e1-0a71316defd0"
  
  
  # puts JSON.pretty_generate(text_to_speech.list_voices.result)
  
  # # Ruby SDK receives an error from TTS, generates an ApiException.
  # begin
  #   # Invoke a Text to Speech method
  # rescue IBMWatson::ApiException => ex
  #   print "Method failed with status code #{ex.code}: #{ex.error}"
  # end
  
  # # Warning message
  # File.open("hello_world.wav", "wb") do |audio_file|
  #   response = text_to_speech.synthesize(
  #     text: "Hello world",
  #     accept: "audio/wav",
  #     voice: "en-GB_KateVoice"
  #   )
  #   audio_file.write(response.result)
  # end
  
  # curl -X POST -u "apikey:7eE5N3sDMBq7ctO_YeCdl4fnZReJgEVCPcwxbw8ZD3pn" \
  # --header "Content-Type: application/json" \
  # --header "Accept: audio/wav" \
  # --data "{\"text\":\"hello world\"}" \
  # --output hello_world.wav \
  # "https://api.us-east.text-to-speech.watson.cloud.ibm.com/instances/f0cdc9cb-a371-432d-87e1-0a71316defd0/v1/synthesize"
  
  # request.body = JSON.dump({
  #   "text" => "Greetings," + firstName + "they are currently," + numberElevator + ................................