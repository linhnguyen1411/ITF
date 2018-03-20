Rails.application.routes.draw do
  root 'static_pages#index'
  get 'static_pages/question_detial'
end
