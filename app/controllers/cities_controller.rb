class CitiesController < ApplicationController
  before_action :set_country

  def index
    if params[:query].present?
      @cities = @country.cities.where("LOWER(name) LIKE ?", "%#{params[:query].downcase}%")
    else
      @cities = @country.cities
    end
  end

  def show
    @city = @country.cities.find(params[:id])
  end

  private

  def set_country
    @country = Country.find(params[:country_id])
  end
end
