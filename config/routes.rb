Rails.application.routes.draw do
  #root 'billboards#index'
root 'artists#index'

resources :billboards

resources :artists do
  resources :movies
end 
# Custom songs to billboards
get 'new_billboard_song/:id', to: 'billboards#new_song', as: 'new_billboard_song'
post 'add_billboard_song/:id/:song_id', to: 'billboards#add_song', as: 'add_billboard_song'
delete 'remove_billboard_song/:id/:song_id', to: 'theaters#remove_song', as: 'remove_billboard_song'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
