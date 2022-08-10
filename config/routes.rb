Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "articles#index"

  resource :quote do
    get 'list', to: "quotes#listQuotes"
    get 'new', to:"quotes#newQuote"
    post 'create', to:"quotes#createQuote"

    get 'show/:id', to: "quotes#showQuote"
    put 'edit/:id', to: "quotes#updateQuote"
    patch 'edit/:id', to: "quotes#updateQuote"
    delete 'delete/:id', to:"quotes#deleteQuote"

  end

  resources :articles do
    resources :comments
  end
  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"
  # Defines the root path route ("/")
  # root "articles#index"
end
