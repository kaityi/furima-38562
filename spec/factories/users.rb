FactoryBot.define do
  factory :user do
    nickname              {'name'}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'山田'}
    last_name             {'太郎'}
    first_name2            {'ヤマダ'}
    last_name_2            {'タロウ'}
    date_of_birth         {'1930-09-20'}
  end
end