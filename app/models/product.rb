class Product < ApplicationRecord
    validates(:title, presence: true, uniqueness: true)
    validates(
        :description,
        presence: { message: "must exist" },
        length: { minimum: 10 }
    )
    validates(
        :price,
        numericality: { greater_than_or_equal_to: 0, allow_blank: true }
    )
end
