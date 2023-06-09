FactoryBot.define do
  factory :user do
    nickname              { Faker::Internet.user_name(1..12)}
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }

    after(:build) do |user|
      user.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end