class MenusController < ApplicationController

  before_action :get_menu, only: [:show,:edit,:update,:destroy]


  def index
    @dishes = Menu.all
    @appetizer = @dishes.select{|d| d.category == "Appetizers"}
    @sushi = @dishes.select{|d| d.category == "Sushi"}
    @noodles = @dishes.select{|d| d.category == "Noodles"}
    @beverages = @dishes.select{|d| d.category == "Beverages"}
    @category_list = [@appetizer, @sushi, @noodles, @beverages]



    # byebug
  end

  def new
    @dish = Menu.new
    @category_list = ["Appetizer", "Sushi", "Beverages", "Noodles"]
  end

  def create
    @dish = Menu.new(menu_params)
    if @dish.save
      redirect_to @dish
    else
      render :new
    end
  end

  def show
  end

  def edit
    @category_list = ["Appetizer", "Sushi", "Beverages", "Noodles"]
  end

  def update
    if @dish.update!(menu_params)
      redirect_to @dish
    else
      render :edit
    end
  end

  def destroy
    @dish.delete
    redirect_to menus_path
  end

  private

  def get_menu
    @dish = Menu.find(params[:id])
  end

  def menu_params
    # dont forget to add ingredients to permit. when you add ingredients to model.
    params.require(:menu).permit(:name, :price)
  end


end
