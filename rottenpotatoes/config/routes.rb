Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  get 'moviesBySameDirector/:id', to: 'movies#moviesBySameDirector', as: 'moviesBySameDirector_movie'
end
