# inside server.rb

require 'sinatra'
require 'json'

# First post we tried 
#post '/' do
# p request.body.read
#end

# Now we know we know that we have a response coming back we need to actually have a valid response that Alexa will reconize
# s vaild input and output

post '/' do
  { 
    version: "1.0",
    response: {
      outputSpeech: {
        type: "SSML",
        ssml: "<speak> Hey do you wanna hear something funny? Jon can now say 'I like man buns' using ruby and Alexa's skill set, that is pretty cool. </speak>"
      } 
    }
  }.to_json
end