FactoryBot.define do
  factory :item do
    item_name            {Faker::Lorem.sentence}
    image                { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, 'app', 'assets',  'images', 'card-amex.gif'))) }

    item_content         {Faker::Lorem.sentence}
    category_id          {2}
    situation_id         {2}
    charge_id            {2}
    prefecture_id        {2}  
    shipping_date_id     {2}
    price                {700}

    association :user
    

  end
end
