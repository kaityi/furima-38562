class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_situation
  belongs_to :prefecture
  belongs_to :delivery_charge
  belongs_to :date_of_shipment
  has_one_attached :image

  validates :item_category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :item_situation_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :date_of_shipment_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_category_id, presence: true
  validates :item_situation_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :date_of_shipment_id, presence: true
  validates :item_explain, presence: true
  validates :item_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                  format: { with: /\A[0-9]+\z/, message: "半角で入力してください"}
end
