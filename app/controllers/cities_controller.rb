class CitiesController < ApplicationController
  before_action :set_country

  def index
    @cities = @country.cities
  end

  def show
    @city = @country.cities.find(params[:id])
  end

  private

  def set_country
    @country = Country.find(params[:country_id])
  end
end
