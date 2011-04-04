# encoding: utf-8

Decide::Application.routes.draw do

  scope(:path_names => {:new => "añadir", :edit => "editar"}) do
    resources :sessions do
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

end
