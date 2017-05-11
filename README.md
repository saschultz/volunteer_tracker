Volunteer Tracker

#### A page for non-profits to track their projects and volunteers, 05.05.2017

#### By Sara Schultz

## Description

As the third independent project at Epicodus as a Ruby student, this project was to create a site for a hypothetical non-profit organization so they could track their projects and volunteers. The site would allow the non-profit employee to create a new project on the site, and then add volunteers to the projects. The non-profit employee would also have the capability to update and delete a project and/or a volunteer.

## Setup/Installation Requirements

* Run Postgres in the terminal
* Open psql by running command psql
* In psql, run CREATE DATABASE volunteer_tracker;
* Run \c volunteer_tracker;
* Run CREATE TABLE projects (id serial PRIMARY KEY, name varchar);
* Run CREATE TABLE volunteers (id serial PRIMARY KEY, name varchar, project_id int);
* Run CREATE DATABASE volunteer_tracker_test WITH TEMPLATE volunteer_tracker;

* Copy the URL to this repository
* Open terminal and navigate to the desktop
* Clone this repository using command: git clone "insert-url-here"
* Open code in text editor of choice

* To run Sinatra use command 'ruby app.rb' to see the site take stage on localhost:4567

## Known Bugs

None known.

## Support and contact details

For support, questions, comments or ideas contact Sara: saschultz8@gmail.com

## Technologies Used

HTML, Bootstrap, Ruby, Sinatra, Postgres

### License

Open source.

Copyright (c) 2017 **Sara Schultz**
