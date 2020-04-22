class Product < ApplicationRecord
    before_validation(:set_default_price)
    before_save(:capitalize_title)
    
    
    validates(:title, presence: true, uniqueness: {case_sensitive: false})
    validates(
        :description,
        presence: { message: "must exist" },
        length: { minimum: 10 }
    )
    validates(
        :price,
        numericality: { greater_than_or_equal_to: 0, allow_blank: true }
    )

    scope(:search, -> (query){ where("title ILIKE ? OR description ILIKE ?", "%#{query}%", "%#{query}%") })


    private 

    def set_default_price
        self.price ||= 1
    end

    def capitalize_title
        self.title = self.title.capitalize
    end

end
