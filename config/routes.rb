FeelmeServer::Application.routes.draw do
  #root :to => 'moods#new' 
  root :to => 'daily_moods#new' 
  post 'moods/create' => 'moods#create', as: 'create_moods' 
  post 'daily_moods/create' => 'daily_moods#create', as: 'create_daily_moods'  
end
