Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get("/", to: "welcome#root")
  get("/about", to: "welcome#about")
  get("/contact_us", to: "welcome#contact_us")
  post("/process_contact", to: "welcome#process_contact")
  

  # Products Router
  # get("/products", to: "products#index")

  # get("/products/new", to: "products#new", as: :new_product)
  # post("/products", to: "products#create" )

  # get("/products/:id", to: 'products#show', as: :product)
  # delete("products/:id", to: 'products#destroy')
  # get("products/:id/edit", to: 'products#edit', as: :edit_product)
  # patch("/products/:id", to: "products#update")
  
  # Reviews productos Router
  # post("/questions/:question_id/reviews", to: "answers#create")
  # delete("/questions/:question_id/reviews/:id", to: "answers#destroy")
  
  resources :products do 
    resources :reviews, only: [:create, :destroy]
  end 

end
