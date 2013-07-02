namespace :db do
desc "Fill database with sample data"
task populate: :environment do
User.create!(name: "Harikrishnan",
email: "am.harikrish@gmail.com",
password: "rubyonrails",
password_confirmation: "rubyonrails")

99.times do |n|
name = Faker::Name.name
email = "creature-#{n+1}@iceage.in"
password = "rubyonrails"
User.create!(name: name,
email: email,
password: password,
password_confirmation: password)
end

users = User.all(limit: 6)
50.times do
content = Faker::Lorem.sentence(5)
users.each { |user| user.microposts.create!(content: content) }
end

end
end
