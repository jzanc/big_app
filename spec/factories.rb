FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
FactoryGirl.define do
  factory :group do
    name "Example Group"
    url "Example_Url"
  end
end
