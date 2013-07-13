IssueTracker::Application.routes.draw do
  
  resources :tickets
  resources :statuses

  root to: 'tickets#new'

end
