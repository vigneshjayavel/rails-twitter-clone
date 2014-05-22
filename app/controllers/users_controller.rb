class UsersController < ApplicationController
  def new
  	@title = "Sign Up"
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  	@title = @user.name
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		#success
      sign_in @user
  		flash[:success] = "Welcome to the sample app"
  		redirect_to @user
  	else
  		@title = "Sign Up"
  		render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
    @title = "Update Profile"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated!!"
      redirect_to @user
    else
      @title = "Update Profile"
      render 'edit'
    end
  end

end
