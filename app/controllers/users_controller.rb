class UsersController < ApplicationController

  before_filter :authenticate, :only => [:edit, :update]
  before_filter :correct_user, :only => [:edit, :update]

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
    @title = "Update Profile"
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated!!"
      redirect_to @user
    else
      @title = "Update Profile"
      render 'edit'
    end
  end

  private
    def authenticate
      puts "authenticate method"
      deny_access unless signed_in?
    end

    def correct_user
      puts "correct_user method"
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

end
