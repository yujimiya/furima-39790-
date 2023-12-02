FactoryBot.define do
  factory :usr do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password}
    password_confirmation {password}
    last_name             {Faker::Lorem}
    first_name            {}
    last_name_kana        {}
    first_name_kana       {}
    birthday              {}
  end
end