Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  resources :posts
  resources :tags
  resources :replies
  resources :users
  resources :reactions
  resources :series
  resources :follows
  root 'static_pages#index'
  get 'static_pages/question_detail'
  get 'static_pages/question_list'
  get 'static_pages/profile'
  get 'static_pages/login'
  get 'static_pages/register'
end
