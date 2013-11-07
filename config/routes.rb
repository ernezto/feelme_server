FeelmeServer::Application.routes.draw do
  post 'moods/create' => 'moods#create'
  root :to => 'moods#new'
  post '/' => 'moods#create'
end
