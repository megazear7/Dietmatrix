class DietsController < ApplicationController

  def index
	@diets = Diet.all
  end

  def new
  	@diet = Diet.new
  end

  def create
  	@diet = Diet.new(params[:diet].permit(:title, :text))
	@foods = params[:diet].permit(:foods)
	@diet.save
	@food = Food.new({:grid_position => params[:diet].permit(:foods)})
	logger.error "food to be saved: " << @food.to_yaml
	@diet.foods.create(@food)
	redirect_to @diet
  end

  def show
  	@diet = Diet.find(params[:id])
  end

  def edit
	@diet = Diet.find(params[:id])
  end

  def update
	@diet = Diet.find(params[:id])
	if @diet.update(params[:diet].permit(:title, :text))
		redirect_to @diet
	else
		render 'edit'
	end
  end

  def destroy
  	@diet = Diet.find(params[:id])
	@diet.destroy
	redirect_to diets_path
  end

end
