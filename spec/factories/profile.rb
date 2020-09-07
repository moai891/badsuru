FactoryBot.define do

  factory :profile do
    phonenumber           { Faker::Number.leading_zero_number(digits: 10) }
    old                   { Faker::Number.between(from: 1, to: 99) }
    job                   { Faker::Number.between(from: 1, to: 6) }
    experience            { Faker::Number.between(from: 1, to: 99) }
    practice_time         { Faker::Number.between(from: 1, to: 7) }
    detail                { Faker::Lorem.sentence }
    club                  { Faker::Team.name }
    avatar                { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/グループ一覧の表示.png')) }
    user_id               {"2"}
  end

end