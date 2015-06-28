class RestaurantsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
    @reviews = Review.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new( restaurants_params )
    @restaurant.save
    redirect_to restaurants_path
  end

  def edit
  end

  def update
    @restaurant = Restaurant.find( params[ :id ] )
    @restaurant.update( restaurants_params )
    redirect_to restaurants_path
  end

  def show
  end


private
    def set_restaurant
      @restaurant = Restaurant.find( params[ :id ] )
    end

    def restaurants_params
      params.require( :restaurant ).permit(
        :name,
        :tel,
        :url,
        :address,
        )
    end
end
