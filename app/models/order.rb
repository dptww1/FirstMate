class Order < ActiveRecord::Base
  belongs_to :squadrons_ship

  validates :order_text, :presence => true

  def to_s
    return order_text
  end
end
