class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :standardize, only: [:create, :update]
  before_action :restricted_access, only: [:show, :edit, :analytics]
  skip_before_action :authorized, only: [:home, :new, :create]

  def index
  end

  def show
  end


  def analytics
    @top_5 =Cart.order_counter[0..4]
    if params[:q]
      @users = User.find_by(phone_number: params[:q].to_i)
    end
    if !@users.nil?
      @all_dishes = @users.carts
      @dishes = []
      if !@all_dishes.nil?
        @all_dishes.each {|dish| dish.done ? @dishes << dish : dish}
      end
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.update(phone_number: @phone_num)
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
    params.require(:user).permit(:name, :username, :password, :password_confirmation, :role)
  end

  def standardize
    @phone_num = params[:user][:phone_number].gsub(/\D/, "")
  end
end
