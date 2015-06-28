class ReviewsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_action :set_review, only: [:show, :edit, :update, :destroy]
    before_action :set_restaurant, only: [:new,:show, :edit, :update, :destroy]
  def new
    #@restaurant = Restaurant.find(params[ :restaurant_id ])
    @review = Review.new
  end

  def create
    @review = Review.new(
      user_id:       current_user.id,
      restaurant_id: params[ :restaurant_id ],
      body:          reviews_params["body"],
      point:         reviews_params["point"],
      )
    @review.save
    redirect_to restaurant_path( @review.restaurant_id   )
  end

  def show
    #@restaurant = Restaurant.find(params[ :restaurant_id ])
  end

  def edit
    #@restaurant = Restaurant.find(params[ :restaurant_id ])
  end

  def update
    @review.update( reviews_params)
    redirect_to restaurant_path( @review.restaurant_id   )
  end

  def destroy
    w_rest = @review.restaurant_id
    @review.destroy
    redirect_to restaurant_path( w_rest   )
  end

private
    def set_review
      @review = Review.find( params[ :id ] )
    end

    def set_restaurant
      @restaurant = Restaurant.find(params[ :restaurant_id ])
    end

    def reviews_params
      params.require( :review ).permit(
        :body,
        :point,
        )
    end
end
