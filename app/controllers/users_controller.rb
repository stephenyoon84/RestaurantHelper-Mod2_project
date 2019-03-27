class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :standardize, only: [:create, :update]
  skip_before_action :authorized, only: [:home, :new, :create]

  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # byebug
    #phone_num = :standardize #params[:user][:phone_number].gsub(/\D/, "")
    # (phone_number: phone_num)

    if @user.update(phone_number: @phone_num)#phone_num)#@user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params) && @user.update(phone_number: @phone_num)
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to new_user_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :username, :password, :password_confirmation)
  end

  def standardize
    @phone_num = params[:user][:phone_number].gsub(/\D/, "")
    # self.gsub(/\D/, "")
  end
end
