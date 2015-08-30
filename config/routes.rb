ItunesApi::Application.routes.draw do

  resources :categories do
    member do
      get ':monetization/top'        => 'categories#top'
      get ':monetization/rank/:rank' => 'categories#rank'
      get ':monetization/publishers' => 'categories#publishers'
    end
  end
end
