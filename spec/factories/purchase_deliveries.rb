FactoryBot.define do
  factory :purchase_delivery do
    post_code { '124-3456' }
    prefecture_id { 2 }
    city { '東京' }
    street_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '12345678901' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
