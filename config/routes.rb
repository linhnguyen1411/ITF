Rails.application.routes.draw do
  root 'static_pages#index'
  get 'static_pages/question_detail'
  get 'static_pages/question_list'
  get 'static_pages/profile'
  get 'static_pages/login'
  get 'static_pages/register'
end
