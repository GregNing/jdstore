# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  quantity    :integer
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Product < ApplicationRecord
    belongs_to :user
    validates :title, :description,presence: { message: "必填項目!" }
    validates :quantity,:price, numericality: {message: "必須為數字！"}    
    scope :descbycreatetime, ->{ order("created_at DESC") }
    
end
