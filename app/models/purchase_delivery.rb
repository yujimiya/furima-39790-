class PurchaseDelivery
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture, :city, :street_number, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :street_number
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is Invalid."}
    validates :user_id
    validates :item_id
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Delivery.create(
      post_code: post_code,
      prefecture: prefecture,
      city: city,
      street_number: street_number,
      building_name: building_name,
      phone_number: phone_number,
      purchase_id: purchase_id
    )
  end
end
