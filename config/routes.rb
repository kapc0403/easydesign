Rails.application.routes.draw do
  
  get "/carrito", to: "payments#carrito"
  resources :attachments
  resources :posts
  resources :payments
  devise_for :usuarios, controllers: {registrations: "registrations"}
  
  resources :usuario
  get 'welcome/index'
  post "usuario/follow"

  

  root 'welcome#index'

end
