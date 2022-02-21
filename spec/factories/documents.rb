FactoryBot.define do
  factory :document do
    shared { true }
    key { "MyString" }
    user_id { 1 }
  end
end
