class Airport < ApplicationRecord
  validates :code, presence: true, uniqueness: true
end
