FactoryBot.define do
  factory :purchase_shipping do
    
    post_code         {'123-4567'}
    prefecture_id     {'2'}
    municipality      {'横浜市緑区'}
    address           {'緑1-1'}
    phone_number      {'09012341234'}
    token {"sk_test_620a618147e1b3f777ce042d"}
    
  end
end
