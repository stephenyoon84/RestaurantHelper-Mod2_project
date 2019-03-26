class CartsController < ApplicationController

  before_action :get_dishes, only: :show

  def index
    @dishes = Cart.all
    @dishes = @dishes.each{|d| d.paid ? @dishes.delete(d) : d.user}
    # byebug
  end

  def show
    @total = @dishes.inject(0){|sum, dish| sum + dish.menu.price}
  end

  def create
    Cart.create!(user_id: session[:user_id], menu_id: params[:id])
    redirect_to menus_path
  end

  def remove_item
    @item = Cart.find(params[:id])
    @item.delete
    redirect_to carts_path
  end

  private

  def get_dishes
    @dishes = Cart.where("user_id = ?", User.find_by(id: session["user_id"]).id)

    if !@dishes.nil?
      @dishes.each {|dish| dish.paid ? @dishes.delete(dish) : dish}
    end
  end
end
