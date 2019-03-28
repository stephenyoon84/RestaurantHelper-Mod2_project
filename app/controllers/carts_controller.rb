class CartsController < ApplicationController

  before_action :get_unpaid_dishes, only: [:show, :order]

  def index
    @uncooked_dishes = []
    @all_dishes = Cart.all
    @all_dishes.each {|dish| !dish.done && dish.paid ? @uncooked_dishes << dish : dish }
  end

  def show
    @total = @dishes.inject(0){|sum, dish| sum + dish.menu.price}
  end

  def create
    Cart.create!(user_id: session[:user_id], menu_id: params[:id])
    redirect_to menus_path
  end

  def order
    @dishes.each do |dish|
      dish.paid = true
      dish.save
    end
    redirect_to carts_ty_path
  end

  def ty
  end

  def complete_order
    @item = Cart.find(params[:id])
    @item.done = true
    @item.save
    redirect_to carts_index_path
  end

  def remove_item
    @item = Cart.find(params[:id])
    @item.delete
    redirect_to carts_path
  end

  private

  def get_all_dishes
    @all_dishes = current_user.carts
  end

  def get_unpaid_dishes
    get_all_dishes()
    @dishes = []
    if !@all_dishes.nil?
      @all_dishes.each {|dish| dish.paid ? dish : @dishes << dish}
    end
  end


end
