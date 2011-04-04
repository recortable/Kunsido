# encoding: utf-8

Decide::Application.routes.draw do

  scope(:path_names => {:new => "nueva", :edit => "editar"}) do
    resources :groups, :path => 'g' do
      resources :topics, :path => 'temas'
      resources :reunions, :path => 'reuniones'
      resources :memberships, :path => 'participantes'
    end
    resources :sessions, :path => 'sesion' do
      get 'enter', :on => :collection
    end
    resources :invitations
  end

  namespace "admin" do
    resources :users
    resources :versions
  end


  root :to => "dashboards#show"
  match "/enter/:id" => "sessions#enter", :as => :enter
  match "/entrar" => "sessions#new", :as => :login
  match "/salir" => "sessions#destroy", :as => :logout

end
