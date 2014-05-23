class UsersController < ApplicationController

  before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => :destroy

  def index
    @title = "All Users"
    @users = User.paginate(:page => params[:page])
  end

  def new
  	@title = "Sign Up"
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page])
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

  def destroy
    user = User.find(params[:id])
    if admin_user? user
      flash[:error] = "Admin cannot be deleted!"
    else
      user.destroy
      flash[:success] = "User destroyed"
    end
    redirect_to users_path
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

    def admin_user
      redirect_to(root_path) unless current_user.admin? 
    end

    def admin_user?(user)
      user.admin?
    end

end
