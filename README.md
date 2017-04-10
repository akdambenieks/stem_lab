# README

#####THIS PROJECT IS CURRENTLY STILL UNDER DEVELOPMENT#####

Welcome to STEM_LAB, the web portal for bringing together experts, educators and
students of the STEM fields to collaborate on real-world citizen science projects
tailored to children.

* Ruby version
2.3.0

* Configuration
Modify the configuration file in config/initializers/app_keys.rb.example and
rename it to config/initializers/app_keys.rb

* Database creation and initialization
Change the seed file to contain your desired user information for the user with
admin priviledges.
Run 'rails db:create db:migrate db:seed'

* Services (job queues, cache servers, search engines, etc.)
Messaging is handled by letter-opener in DEV environment on a delayed queue
managed by delayed_job_active_record.  Run 'rails jobs:work' to start the delayed
jobs queue.

* Deployment instructions

#####NOT YET READY TO DEPLOY#####
