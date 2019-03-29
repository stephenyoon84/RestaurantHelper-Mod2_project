class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :standardize, only: [:create, :update]
  before_action :restricted_access, only: [:show, :edit, :analytics]
  skip_before_action :authorized, only: [:home, :new, :create]

  def index
  end

  def show
    get_dishes(@user)
  end


  def analytics
    @top_5 =Cart.order_counter[0..4]
    if params[:q]
      @users = User.find_by(phone_number: params[:q].gsub(/\D/, "").to_i)
      if @users
        @favorite_dish = @users.carts.order_counter.max_by{|a| a[1]}[0]
      end
    end
    get_dishes(@users)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.update(phone_number: @phone_num)
      session[:user_id] = @user.id
      redirect_to menus_path
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

  def get_dishes(arg)
    if !arg.nil?
      @all_dishes = arg.carts
      @dishes = []
      if !@all_dishes.nil?
        @all_dishes.each {|dish| dish.paid ? @dishes << dish : dish}
      end
    end
  end
end
