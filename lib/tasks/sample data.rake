require "faker"

namespace :db do
	desc "Fill db with sample data"
	task :populate => :environment do
		Rake::Task['db:reset'].invoke
		admin = User.create!(:name => "Example User", :email => "example@acme.com", :password => "123123", :password_confirmation => "123123")
		admin.toggle!(:admin)
		99.times do |n|
			name = Faker::Name.name
			email = "example#{n}@acme.com"
			password = "123123"
			password_confirmation = "123123"
			User.create!(:name => name, :email => email, :password => password, :password_confirmation => password_confirmation)
		end

		User.all(:limit => 6).each do |user|
			50.times do
				user.microposts.create!(:content => Faker::Lorem.sentence(5))
			end 
		end
	end
end