class Shipping < ApplicationRecord
  belongs_to :order
  belongs_to :shipping_zone
end
