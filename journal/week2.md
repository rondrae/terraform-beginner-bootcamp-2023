# Terraform Beginner Bootcamp 2003 - Week 2

## Working with Ruby

### Bundler

I know nothing of Ruby. Bundler is a package manager for Ruby. It is primary way to install Ruby packages known as gems.


#### Install Gems

Create gemfile and define gems in that file.

```
source "https://rubygems.org"

gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activerecord'

```

Then run bundle install command. This will install all the gems in the gemfile. This will install all the gems locally. A gemfile.lock will be created that shows the version of the gems installed.

#### Executing ruby scripts

To run a script we use `bundle exec` . This tells future ruby scripts to use the gems we installed.


### Sinatra

Sinatra is a micro web framework for ruby to build web-apps. It is normally used for small projects or dev servers. It allows you to create a webserver in a single file. [Sinatra](https://sinatrarb.com/)


## Terratowns Mock Server

### Running the web server

To run the server run the follow commands 
```
bundle install
bundle exec ruby server.rb
```

The .rb file contains all the code for the server.


## Build Terraform Provider Terratowns

Bunch of Go language stuff. Chaged the terraform log level to debug to get more information when we run terraform commands. I also set it as an environment variable in the gitpod.yml file.


## CRUD

Terraform Provider resources utilize CRUD.

CRUD means Create, Read Update, and Delete

## Tested pushing my TerraTown

I managed to push my terratowns to missingo and was able to view it as well as my websites. For some reason gitpod ate my modules variables file and I had to recreated. Maybe it is my fault, I had variables.tf in my gitignore file. I was already using provider random to create prefix on the end of my bucket name. Changed my TF LOG to INFO as I was getting too much info in the console. I will set it to debug only if I have an error.
