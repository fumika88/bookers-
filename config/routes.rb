Rails.application.routes.draw do
 resources :books
 get 'top' => 'homes#top'
end
