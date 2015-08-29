ItunesApi::Application.routes.draw do

  get '/categories/:category_id/top/:monetization' => 'categories#top'
  get '/categories/:category_id/rank/:monetization/:rank' => 'categories#rank'

end
