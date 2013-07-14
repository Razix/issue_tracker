IssueTracker::Application.routes.draw do
  
  match '/signup', to: 'admins#new'

  resources :tickets
  resources :statuses
  resources :admins

  root to: 'tickets#new'

end
