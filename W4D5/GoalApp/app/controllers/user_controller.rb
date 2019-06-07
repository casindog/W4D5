class UserController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def edit
    #User.find(params[:id])
    #User.find_by(key: value)
    @user = User.find_by(id: params[:id])
    render :edit
  end

  def index
    @users = User.all
    render :index
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      redirect_to user_index_url #eventually goes to login page
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to user_index_url
    # render plain: "IT WORKED"
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to user_index_url
  end
end
