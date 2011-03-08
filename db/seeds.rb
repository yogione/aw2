 require 'open-uri'
 require 'active_record/fixtures'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#Retiree.create!( :id => 200, :user_id =>"jon", :first_name => "jon", :last_name => "smith", :years_worked => 32, :plant => "Flint", :pet_story => "coffee on manager", :what_are_you_doing => "fishing in hawai" , :message_to_ceo => "good job keep it up")
#Retiree.create!( :id => 200, :user_id =>"jon1", :first_name => "jon1", :last_name => "smith1", :years_worked => 32, :plant => "Toledo", :pet_story => "coffee on manager", :what_are_you_doing => "fishing in hawai mexico" , :message_to_ceo => "good job keep it up really - i mean it")
Story.create!( :id => 300, :title =>" Kia beats GM hands down", :teaser => "Kia beats GM hands down", :url => "http://www.kia.com", :user_id => 200, :votes => 50)
Story.create!( :id => 301, :title =>" Hundai beats GM hands down", :teaser => "Hundai beats GM hands down", :url => "http://www.kia.com", :user_id => 200, :votes => 50)
