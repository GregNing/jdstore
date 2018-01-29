class Product < ApplicationRecord
    belongs_to :user
    validates :title, :description,presence: { message: "必填項目!" }
    validates :quantity,:price, numericality: {message: "必須為數字！"}    
    scope :descbycreatetime, ->{ order("created_at DESC") }
    
end
