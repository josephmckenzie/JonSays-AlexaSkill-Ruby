This repo will show you how to build a simple Alexa skill ("Jon says") that uses Ruby, Heroku , ngrok . It used to be that Amazon's Alexa had to be hosted using a lambda which is a pretty sweet service, but Lambdas cost money even if it is only while running the service now it seems we can use a ngrok tunnel to get around that which is awesome. If we are able to make an ALexa skill using it we can use it to by pass the need for lambdas thus saving clients money which is really cool. I just started using ngrok earlier tonight so there are biund to be some issues i will run in to but none yet so thats pretty cool.

 ###### Setting up our alexa skill set so our app can connect to it and it has the info it needs to do its thing  #####

1. Lets Start by Logging in to our Amazon developer console ( https://developer.amazon.com/  ) 

2. Click on Amazon Alexa

3. Click on the "Alexa skill set" menu 
 3a. Click on "Get Started" 
 3b. CLick on "Alexa Skills Set"
 
4. CLick on "Start a skill"

5. Leave the default selection "Custom Interaction Model" selected

6. Give your skill a name 

7. Choose an invocation name, this is how you will launch your skill "IE: Alexa jon says"

8. Click Save

9. Click next to go to the Interaction Model

10. Under the intent schema enter the following json 

   {
  "intents": [
    {
      "intent": "JonSays"
    }
  ]
}

* An intent is how different things you say will provide a different reaction based on what you say

11. Enter a sample utterance such as "JonSays say something funny" 
   * Notice how it started with JonSays like we put up in our intent
   
12.  Click save and next

13. In our Configuration under Endpoint choose "HTTPS"

14. under default enter your herokuapp domain 

15. Choose yes for "Provide geographical region endpoints"

16. Choose the region closet to you 
 16a. Enter the same url you did in default 

17. CLick save and Next

18. Choose "My development endpoint is a sub-domain of a domain that has a wildcard certificate from a certificate authority" for default endpoint ( i chose to pick it under NA and DEafult but it seems to have deslected it under NA automatically when i came back to it)

##### Building our Actual Alexa Skill using Ruby. ######


1. First we need to require "sinatra" and "json"

2. We need sinatra because thats what we use for our server and json because we will be sending json to alexa to then read and do her thing.

3. Check out the server.rb file to see how we set up our very basic skill

4. Alexa when calling our endpoint will hit our "post" route. I originally did not have a get but when i first uploaded my app to heroku it didnt have a get so of course it didnt find the app.

5. Make your gem file and your procfile. If you need to check out mine to see what it should look like, however if your trying to do this you should know about procfiles and gemfiles already. 

6. Run bundle install to make your gem.lock file


####### downloading and installing ngrok ########


1. Go to https://ngrok.com/download and download the apporaite version for your system ( I am using linux so this tutorial is done in it)

2. unzip and copy the downloadable exectuable to your app folder

3. Sign up for a free acount 

4. under getting started you can find your authtoken you will need this for your heroku app

##############################################################################

####### Creating your heroku app ##############

1. Login to heroku 

2. Click create new app 

3. Give your app a name, and click create app

4. Deploy how you want to deploy but i do it through the command line so thats how im gonna show here

 * this is how you set your app to your folder so we can do our thing through the command line
 
5. $ cd my-project/
   $ git init
   $ heroku git:remote -a thisisyourappname
   
   
   * Lets Deploy it 
   
6. $ git add .
   $ git commit -am "make it better"
   $ git push heroku master
   
7. We need to set our ngrok token in our config vars 
     $ heroku config:set NGROK_API_TOKEN=hereyouwillputthetokenyougotfromngrok

8. We clear any build packs that may be installed already 
    $ heroku buildpacks:clear
    
9. Set a ruby buildpack 
   $ heroku buildpacks:add heroku/ruby
   
   ## Doesnt seem like I need this below part , we shall se though ##
<!--

10. Set SSH Enabled to true 
   $ heroku config:set SSH_ENABLED="true"
   
11. redeploy your app 

12. add the ssh build pack 
   $ heroku buildpacks:set https://github.com/jkutner/heroku-buildpack-ssh.git
-->
   

JonSays-AlexaSkill-Ruby
