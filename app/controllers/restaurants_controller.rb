class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: :show

  def index
    @restaurants = Restaurant.all
    filter_by_query if params[:q].present?
    filter_by_query if params[:city].present?
    filter_by_category if params[:category].present?
  end

  def show
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def filter_by_query
    @restaurants = @restaurants.ransack(name_or_description_cont: params[:id]).result
  end

  def filter_by_cities
    @restaurants = @restaurants.where(city: params[:city])
  end

  def filter_by_category
    @restaurants = @restaurants.select do |r|
      r.category.title = params[:category]
    end
  end
  
end
