Village::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root :to => 'posts#index'
  get "/out/:id" => "posts#out", :as => :out
  get "thank-you-email" => "application#thanks", :as => :thanks
  get "outdoor-movies-2015" => "pages#movies", :as => :movies
  get "email-brief" => "pages#brief", :as => :brief
  get "submit-a-story" => "posts#submit", :as => :submit_a_story

  resources :posts
  resources :comments
  get 'feed' => 'posts#feed'

  # 301's
  get "archive" => redirect {"/"}
  get "about" => redirect {"/"}
  get "posts(/*path)" => redirect {"/"}
  get "blog(/*path)" => redirect {"/"}
  get "blog" => redirect {"/"}
  
end
