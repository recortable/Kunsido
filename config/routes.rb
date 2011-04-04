# encoding: utf-8

Decide::Application.routes.draw do

  root :to => "dashboards#show"
  match "/enter/:id" => "sessions#enter", :as => :enter
  match "/entrar" => "sessions#new", :as => :login
  match "/salir" => "sessions#destroy", :as => :logout

  namespace "admin" do
    resources :users
    resources :versions
  end

  resources :comments, :except => [:index, :show]
  resources :versions, :path => 'actividad', :only => :show
  scope(:path_names => {:new => "anadir", :edit => "editar"}) do
    resources :sessions, :path => 'sesion' do
      get 'enter', :on => :collection
    end
    resources :groups, :path => '' do
      resources :topics, :path => 'temas'
      resources :reunions, :path => 'reuniones'
      resources :memberships, :path => 'participantes'
    end

    resources :invitations
  end





end
