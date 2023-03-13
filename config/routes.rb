Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :challenges, only: %i[index show]
  get 'battles/:battle_id/rewards', to: 'battles#rewards', as: 'rewards_battle'
  get 'pvp_battles/:pvp_battle_id/rewards', to: 'pvp_battles#rewards', as: 'rewards_pvp_battle'
  resources :battles, only: %i[new create show] do
    patch :play_card, on: :member
    patch :simulate_turn, on: :member
  end
  resources :cards, only: %i[index show]
  resources :offers, only: %i[index] do
    patch :buy, on: :member
  end
  resources :pvp_battle_teams, only: %i[index]
  resources :pvp_battles, only: %i[new create show] do
    patch :play_card, on: :member
    patch :simulate_turn, on: :member
  end
end
