# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    params.permit!
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url
    else
      render :new
    end
  end

  def new
    @user = User.new
  end
end
