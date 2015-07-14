Village::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root :to => 'posts#index'
  get "/out/:id" => "posts#out", :as => :out
  get "thank-you-email" => "application#thanks", :as => :thanks
  get "outdoor-movies-2015" => "pages#movies", :as => :movies
  get "email-brief" => "pages#brief", :as => :brief
  get "submit-a-story" => "posts#submit", :as => :submit_a_story

  resources :articles
  get 'posts/:posts_id/link_comments' => 'comments#link_comments', :as => :link_comments
  resources :posts do
    resources :comments do
      member do
        get "parent-reply", to: "comments#parent_reply", :as => :parent_reply
        put "vote", to: "comments#vote"
        put "removevote", to: "comments#removevote"
      end
    end
  end
  
  # Polls
  resources :polls do
    resources :comments do
      member do
        get "parent-reply", to: "comments#parent_reply", :as => :parent_reply
        put "vote", to: "comments#vote"
        put "removevote", to: "comments#removevote"
      end
    end
  end
  resources :poll_items do
    member do
      put "vote", to: "poll_items#vote"
      put "removevote", to: "poll_items#removevote"
    end
  end  

  get 'comments/highlight/:id' => 'comments#highlight', :as => :highlight_comment
  get 'feed' => 'posts#feed'
  get 'comments-feed' => 'comments#feed'

  # 301's
  get "archive" => redirect {"/"}
  get "about" => redirect {"/"}
  get "posts(/*path)" => redirect {"/"}
  get "blog(/*path)" => redirect {"/"}
  get "blog" => redirect {"/"}
  
end
