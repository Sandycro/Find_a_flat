class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  validates :end_date, presence: true
  #validates :end_date, date: {after_or_equal_to: :start_date}
end
