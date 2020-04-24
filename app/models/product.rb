class Product < ApplicationRecord
    has_many :reviews, dependent: :destroy


    before_validation(:set_default_price)
    after_create(:set_sale_to_price)
    before_save(:capitalize_title)
    

    validates(:title, presence: true, uniqueness: {case_sensitive: false})
    validates(:description, presence: { message: "must exist" },length: { minimum: 10 })
    validates(:price, numericality: { greater_than_or_equal_to: 0, allow_blank: true })
    validates(:sale_price, numericality: { less_than_or_equal_to: :set_default_price, allow_blank: true })

    scope(:search, -> (query){ where("title ILIKE ? OR description ILIKE ?", "%#{query}%", "%#{query}%") })
    
    def increment_hit 
        hit_count  += 1
    end

    private 


    def set_default_price 
        self.price ||= 1
    end

    def capitalize_title
        self.title = self.title.capitalize
    end

    def set_sale_to_price
        if self.sale_price == ''
        self.sale_price ||= self.price
        end
    end

end
