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

Bunch of Go language stuff.
