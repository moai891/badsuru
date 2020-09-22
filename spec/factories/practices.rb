FactoryBot.define do
  factory :practice do
    name                  { ForgeryJa(:name).full_name }
    group_name            { Faker::Team.name }
    date                  { Faker::Date.forward(days: 23) }             
    start_time            { "18:00" }
    end_time              { "21:00" }
    prefecture_code       { Faker::Number.between(from: 1, to: 47) }
    city                  { Faker::Address.city }
    place                 { Faker::Address.community }
    detail                { Faker::Lorem.sentence }
    visitor_pay           { Faker::Number.between(from: 0, to: 2000) }
    shuttle               { FactoryBot.create(:shuttle) }
    manager_id            { FactoryBot.create(:user) } 
    member_limit          { Faker::Number.between(from: 1, to: 99) }
  end
end
