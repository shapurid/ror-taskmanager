# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/new'
  root 'home#index'
end
