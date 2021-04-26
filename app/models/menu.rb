class Menu < ApplicationRecord
  belongs_to :user
  has_one :food_stuff
  has_one_attached :image
end
