class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :required_user, only: [:edit, :update]
  before_action :required_same_user, only: [:edit, :update, :destroy]

  def show
    @articles = @user.articles
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 2)

  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "#{@user.username}, your account was successfully updated."
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.username}, you have successfully signed up."
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:notice] = 'Account and all information related to your account will be deleted'
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def required_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = 'You can only edit or delete your own profile.'
      redirect_to @user
    end
  end

end
