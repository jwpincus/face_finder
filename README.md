
# Facial Recognition User System and login
This project is a fork of the basic facial recognition system I designed [here](https://github.com/jwpincus/facial-login-standalone)

This fork is exploring using facial data to authenticate IOT device users that are registered with the site.
## Setup
+ this is a rails app. You will need ruby and rails installed on your machine.
+ This app uses a postgres database. You will need to have a PG server running, or be able to configure a connection to one.
### After download run:
+ `bundle`
+ `rake db:create` creates a db on your local postgres server, or a remote if configured
+ `rake db:migrate` creates the necessary tables and columns in the db
+ set the environment variables for kairos_app_id, kairos_key (get from free Kairos account), kairos_gallery (users choice, make sure to use a different name for production or else there will be user_id conflicts) and confidence (this variable determines the minimum threshold for a login rejection. set a number between 0.0 and 1.0. The higher the number, the more strict the rejection criteria. Recommend starting at 0.7)
++ `rails s` will start the server

## More Info
Read the write-up [here](https://medium.com/@Jwpincus/i-made-a-thing-facial-recognition-e694bc1ac8c8)

## API
