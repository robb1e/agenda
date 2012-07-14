#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Agenda::Application.load_tasks

build_tasks = [
  "db:migrate",
  "db:test:prepare",
  "rspec",
  "best_practices"
]

task :ci => build_tasks
