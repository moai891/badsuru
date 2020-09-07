FactoryBot.define do
pass = Faker::Internet.password(8)
  factory :user do
    nickname              { ForgeryJa(:name).full_name }
    email                 { Faker::Internet.free_email }
    password              { pass }
    password_confirmation { pass }

    # after(:create) do |user|
    #   @groups = create_list(:group, 3, users: [user])
    # end
    # after(:create) do |user|
    #   user.groups << create(:group)
    # end
  end

end