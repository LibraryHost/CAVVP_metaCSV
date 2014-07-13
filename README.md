CAVVP_metaCSV
=============

## Project Overview 

This is a project for an Omeka plugin to allow the export of meta-data to csv. 

## Structure

This project uses [Vagrant] (http://www.vagrantup.com/) for running the development server. On osx, after installing the pre-reqs listed below, navigate to the root foler of the repo and run `vagrant up`. From there, visit [localhost:4567] (http://localhost:4567). 

With the server running, the Omeka site files will be located in the root/www/ directory. 

The project plugin lives in the root/plugin folder and is automatically loaded into the development server upon `vagrant up` command. 

# Pre-reqs. 
On osx: 

[Vagrant] (http://www.vagrantup.com/) 

[Virtual Box] (http://www.virtualbox.org/)


# Specs. 
The development server is set to run with the following dependencies. 

Ubuntu 12.01

mysql-server

apache2 

php5 
