FactoryBot.define do
  factory :user do
    fullname { "Some Name" }
    username { "Some" }
    password { "Pass@1234" }
    email { "somename@gmail.com" }
  end
end
