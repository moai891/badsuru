FactoryBot.define do
  factory :group do
    name                  { Faker::Team.name }
    detail                { Faker::Lorem.sentence }
    group_avatar          { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/グループ一覧の表示.png')) }
  end
end
