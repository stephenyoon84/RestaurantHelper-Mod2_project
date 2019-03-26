class CartsController < ApplicationController

  before_action :get_dishes, only: :show

  def index

  end

  def show
     @total = @dishes.inject(0){|sum, dish| sum + dish.menu.price}
  end

  private

  def get_dishes
    @dishes = Cart.where("user_id = ?", User.find_by(id: session["user_id"]).id)

    if !@dishes.nil?
      @dishes.each {|dish| dish.paid ? @dishes.delete(dish) : dish}
    end
  end
end