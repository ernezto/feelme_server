FeelmeServer::Application.routes.draw do
  root :to => 'moods#new' 
  post 'moods/create' => 'moods#create', as: 'create_moods'  
end
