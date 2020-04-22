class User < ApplicationRecord
    
     


    scope(:search, -> (query){ where("first_name LIKE ? OR last_name LIKE ? OR email LIKE ?", "#{query}", "#{query}", "#{query}") })   
end
