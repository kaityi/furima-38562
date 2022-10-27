FactoryBot.define do
  factory :item  do
    association :user, factory: :user

    item_name            {'ペン'}
    item_price             {'1000'}
    item_explain            {'これはペンです'}
    item_category_id            {'2'}
    item_situation_id            {'2'}
    prefecture_id            {'2'}
    delivery_charge_id            {'2'}
    date_of_shipment_id            {'2'}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
