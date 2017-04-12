# README

#####THIS PROJECT IS CURRENTLY STILL UNDER DEVELOPMENT#####

Welcome to STEM_LAB, the web portal for bringing together experts, educators and
students of the STEM fields to collaborate on real-world citizen science projects
tailored to children.

You can test out the features of this application at: ###INSERT HEROKU LINK HERE###
Please note that as this project is still under development many of the features,
(eg: new user creation, notification mailers, message board, etc...) are currently
disabled.

* User Interactions
There are three types of user roles possible with this application: experts, educators
and students.  The actions of the three types of users are affected by each other.
The experience of each type of user as well as test login information for each
type is listed below:

EXPERTS - login email: test@expert.mail, password: testexpert
Experts have the ability to propose and promote(under development) experiments for
publication.  In addition, experts have access to message boards related to each
experiment where they can add or respond to comments from other experts/educators
to help improve the experiments or respond to specific questions sent by students
(curated by educators).
Experts also have the ability to edit their own proposed and unapproved experiments
based on the messages they receive.  Once an experiment has been promoted by a
number of other experts the experiment goes to an approved state at which point
it will be viewable to educators.  Once in an approved state the experiment cannot
be modified.

EDUCATORS - login email: test@educator.mail, password: testeducator
Educators can preview all approved experiments and add experiments to their list of
bookmarked experiments.  Educators can also create new classrooms which act as
portals for students to enter the site.  Once a classroom has been created, the
educator can assign experiments from their list of bookmarked experiments.  Only
assigned experiments will be visible to logged in students

STUDENT - login classroom: TestClass, password: testclass
Students can view and submit data to experiments that heve been assigned by their
teachers.

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
