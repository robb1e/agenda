# Agenda

[![Build Status](http://travis-ci.org/robb1e/agenda.png?branch=master)](http://travis-ci.org/robb1e/agenda)

## Database

	rake db:create db:setup

## Social connections

### Foursquare

Login (and register if requireed) into [developer.foursquare.com](http://developer.foursquare.com), click on 'My Apps' and then on 'Register a new consumer'. Enter details and the callback URL as

	http://localhost:3000/auth/foursquare/callback

Copy the client ID and secret and set on your path

	export FOURSQUARE_KEY=<your client id>
	export FOURSQUARE_SECRET=<your client secret>

You will need to run these commands in each new terminal session before you start the web app.

### Facebook

Login to [developer.facebook.com](http://developer.facebook.com), click on 'Apps' in the navigation and create a new app. The site URL should be

	http://localhost:3000

Copy the App ID/Key and secret and set on your path

	export FACEBOOK_KEY=<your client key>
	export FACEBOOK_SECRET=<your client secret>

You will need to run these commands in each new terminal session before you start the web app.

## Local build

The following command will run database migrates, rspec tests and the Rails best practices tool.  This is what gets run on CI, run this before pushing to master.

	rake ci

## Starting	

You need to set FOURSQUARE_KEY, FOURSQUARE_SECRET, FACEBOOK_KEY and FACEBOOK_SECRET in your environment to use the authentication parts of the application.

### Running locally

Run the following command to run the app.

	rails s

### Running on Heroku

	heroku create
	heroku push origin master
	heroku run db:create -a <APP_NAME>
	heroku run db:migrate -a <APP_NAME>
	heroku config:add FOURSQUARE_KEY=<FOURSQUARE_KEY> -a <APP_NAME>
	heroku config:add FOURSQUARE_SECRET=<FOURSQUARE_SECRET> -a <APP_NAME>
	heroku config:add FACEBOOK_KEY=<FACEBOOK_KEY> -a <APP_NAME>
	heroku config:add FACEBOOK_SECRET=<FACEBOOK_SECRET> -a <APP_NAME>

## Continuous Integration

CI is supported through [Travis](http://travis-ci.org/#!/robb1e/agenda)