require 'rspec'
require 'page-object'
require 'pry'
require 'headless'
require 'rest-client'

World(PageObject::PageFactory)

@@url = ENV['URL']


