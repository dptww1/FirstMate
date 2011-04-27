class Order < ActiveRecord::Base
  belongs_to :squadrons_ship

  def to_s
    return order_text
  end
end
