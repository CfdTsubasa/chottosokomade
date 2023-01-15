FactoryBot.define do
  factory :user_01,class: User do
    id { 1 }
    name { "test1" }
    profile { "こんにちは。ここにはプロフィールが入ります。" }
    email { "test_01@gmail.com" }
    password { "password" }
  end

  factory :user_02,class: User do
    id { 2 }
    name { "test2" }
    profile { "こんにちは。ここにはプロフィールが入ります。" }
    email { "test_02@gmail.com" }
    password { "password" }
  end
end