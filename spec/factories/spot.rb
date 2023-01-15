FactoryBot.define do
  factory :spot do
    id { 10 }
    name { "test" }
    comment { "user@email.com" }
    address { "墨田区" }
  end

  factory :spot_01,class: Spot do
    id { 20 }
    name { "dfghjkl;" }
    comment { "spot_01のコメント" }
    address { "渋谷区" }
  end
end