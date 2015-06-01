Village::Application.routes.draw do

  root :to => 'posts#index'
  get "/out/:id" => "posts#out", :as => :out
  get "admin" => "admin/posts#index"

  namespace :admin do
    resources :posts
  end

  # 301's
  get "archive" => redirect {"/"}
  get "about" => redirect {"/"}
  get "posts(/*path)" => redirect {"/"}
  get "blog(/*path)" => redirect {"/"}
  get "blog" => redirect {"/"}
  
end
