class Flat < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :address, presence: true
  has_one_attached :photo
end
