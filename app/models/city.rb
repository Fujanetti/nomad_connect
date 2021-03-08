class City < ApplicationRecord
  has_many :forums
  has_many :locations
  has_many :users, through: :locations
  validates :name, presence: true, uniqueness: true
  has_many :events
end
