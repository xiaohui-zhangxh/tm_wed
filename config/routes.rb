TmCard::Application.routes.draw do

  namespace :api do
    namespace :v1 do
      scope 'cate:cate_id' do
        resources :templates, except: [:new, :edit] do
          member do
            get "fields"
          end
        end
      end
    end
  end
  
  namespace :app do
    get "site/new"
    post "site/create"
    get "site/upload"
    get "site/preview"
  end
  
  get '/home/dialog_banner'
  get '/home/dialog_music'
  resources :site_images do 
    collection {post :sort}
    collection {get :app}
  end

  resources :members do
    collection{get :new_token}
    collection{post :verify_token}
  end

  resources :site_comments #for show on client
  resources :site_pages

  resources :sites do 
    resources :site_steps
    resources :site_comments #for admin manage
    collection do
      post :send_sms
    end
    get 'preview'
    get 'themes'
    get 'payment'
    post 'set_theme'
    post 'verify_payment_token'
    post :alipay_notify
  end
  namespace :sites do
    post "temp_form_update"
  end
  match '/s-:site_id(/p-:id)', to: "s#index", via: :get
  match '/templates(/page/:page)', to: "home#templates", via: :get, as: 'templates'
  match '/templates/:id', to: "home#template", via: :get, as: 'template'
  match '/search(/page/:page)', to: "home#search", via: :get, as: 'search'
  match '/case(/page/:page)', to: "home#case", via: :get, as: 'case'
  match '/blog(/page/:page)', to: "home#blog", via: :get, as: 'blog'
  match '/post/:id', to: "home#post", via: :get, as: 'post'
  match '/pricing', to: "home#pricing", via: :get, as: 'pricing'
  match '/vip', to: "home#vip", via: :get, as: 'vip'
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end