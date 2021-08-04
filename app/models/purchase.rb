class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :list
  has_one :street_address
end
