namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    name = Faker::Name.name
    url = "example_group"
    group = Group.create!(name: name, url: url)

    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| group.microposts.create!(content: content, user: user)
                          user.microposts.create!(content: content, group: group) }
    end
  end
end

