FeelmeServer::Application.routes.draw do
  post 'moods/create' => 'moods#create'
end
