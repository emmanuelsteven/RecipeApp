class FoodsController < ApplicationController
  before_action :set_food, only: %i[show destroy]

  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @user = current_user
    @food = Food.new
    # authorize! :create, @food
  end

  def create
    @user = current_user # You need to assign @user here
    @food = @user.foods.new(food_params) # Use `foods` instead of `food`

    if @food.save
      redirect_to user_foods_path(current_user), notice: 'Food List was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to user_foods_path(current_user), notice: 'Food List was successfully destroyed.'
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
