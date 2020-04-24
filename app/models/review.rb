class Review < ApplicationRecord
  belongs_to :product

  validates(:rating, numericality: { greater_than_or_equal_to: 1,  allow_blank: false })
  validates(:rating, numericality: { less_than_or_equal_to: 5, allow_blank: false })
end
