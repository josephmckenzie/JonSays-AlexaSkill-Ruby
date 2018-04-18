# inside server.rb

require 'sinatra'
require 'json'

configure do
  $stdout.sync = true
end
# First post we tried , which returned our json out put in our terminal 
#post '/' do
# p request.body.read
#end

# Now we know we know that we have a response coming back we need to actually have a valid response that Alexa will reconize
# s vaild input and output

get '/' do
    puts "Jon says"
    "jon Says"
end

post '/' do
  { 
    version: "1.0",
    response: {
      outputSpeech: {
        type: "SSML",
        ssml: "<speak> Hey Wanna Hear Something Really Cool?, There is a at least one Jon says app in the following languages Ruby, Nodejs, Java, PHP, Angular and even a phone app or two. </speak>"
      } 
    }
  }.to_json
end
