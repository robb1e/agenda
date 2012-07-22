# Agenda

[![Build Status](http://travis-ci.org/robb1e/agenda.png?branch=master)](http://travis-ci.org/robb1e/agenda)

## Database

	rake db:create

## Testing

	rails generate rspec:install

## Starting	

You need to set FOURSQUARE_KEY, FOURSQUARE_SECRET, FACEBOOK_KEY and FACEBOOK_SECRET in your environment to use the authentication parts of the application.

## Heroku

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