FactoryBot.define do
  factory :article do
    title                  { 'タイトル' }
    text                { '説明' }
    genre_id            { 3 }

    association :user

  end
end
