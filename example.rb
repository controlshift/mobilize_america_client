#!/usr/bin/env ruby

require 'mobilize_america_client'
require 'dotenv'
require 'byebug'

Dotenv.load('.env')

client = MobilizeAmericaClient::Client.new(api_key: ENV['API_KEY'], api_domain: ENV['API_DOMAIN']) # rubocop:disable Lint/UselessAssignment

puts "Ready to call Mobilize America using 'client' object"
byebug # rubocop:disable Lint/Debugger

puts "Bye!"
