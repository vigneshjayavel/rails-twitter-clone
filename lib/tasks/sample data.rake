require "faker"

namespace :db do
	desc "Fill db with sample data"
	task :populate => :environment do
		Rake::Task['db:reset'].invoke
		User.create!(:name => "Example User", :email => "example@acme.com", :password => "123123", :password_confirmation => "123123")
		99.times do |n|
			name = Faker::Name.name
			email = "example#{n}@acme.com"
			password = "123123"
			password_confirmation = "123123"
			User.create!(:name => name, :email => email, :password => password, :password_confirmation => password_confirmation)
		end
	end
end