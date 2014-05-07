FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :group do
    name "Example Group"
    url "Example_Url"
  end

  factory :micropost do
    content "Lorem ipsum"
    user
    group
  end
end
