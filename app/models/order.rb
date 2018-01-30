class Order < ApplicationRecord
    before_create :generate_token
    belongs_to :user    
    #產生亂數代碼
    #before_create 是 Rails model 内建的 callbacks，目的是让资料生成储存前先执行某某动作。
    #比如说我们在这里就是让订单在生成前，先生成「乱数序号」。而SecureRandom.uuid 是 Ruby 内建的随机生成器。
    def generate_token
      self.token = SecureRandom.uuid
    end
    validates :billing_name, presence: true
    validates :billing_address, presence: true
    validates :shipping_name, presence: true
    validates :shipping_address, presence: true
    has_many :product_lists
    def set_payment_with!(method)
    self.update_columns(payment_method: method )
    end

    def pay!
    self.update_columns(is_paid: true )
    end
      include AASM

  aasm do
    state :order_placed, initial: true
    state :paid
    state :shipping
    state :shipped
    state :order_cancelled
    state :good_returned


    event :make_payment, after_commit: :pay! do
       transitions from: :order_placed, to: :paid
    end

    event :ship do
      transitions from: :paid,         to: :shipping
    end

    event :deliver do
      transitions from: :shipping,     to: :shipped
    end

    event :return_good do
      transitions from: :shipped,      to: :good_returned
    end

    event :cancel_order do
      transitions from: [:order_placed, :paid], to: :"order_cancelled"
    end
  end
end
