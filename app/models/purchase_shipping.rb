class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :address, :building, :phone_number, :purchase, :user_id, :item_id, :token

  validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :municipality, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :token, presence: true
  validates :phone_number,length: { minimum: 10 }
  validates :phone_number,length: { maximum: 11 }
  validates :phone_number,format: { with: /\A[0-9]+\z/, message: "半角で入力してください"}
  
  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
   
    Shipping.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_number: phone_number, purchase: purchase)
  end
end