IssueTracker::Application.routes.draw do

  root to: 'tickets#new'

  resources :tickets do
    resources :comments
  end
  resources :statuses
  resources :admins
  resources :sessions, only: [:new, :create, :destroy]

  match '/signup',  to: 'admins#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  match '/unassigned', to: 'tickets#unassigned_tickets'
  match '/open',       to: 'tickets#open_tickets'
  match '/hold',       to: 'tickets#hold_tickets'
  match '/closed',     to: 'tickets#closed_tickets'

end
