class CountriesController < ApplicationController
  def index
    if params[:query].present?
      @countries = Country.where("name ILIKE ?", "%#{params[:query]}%").page(params[:page]).per(10)
    else
      @countries = Country.page(params[:page]).per(10)
    end
  end
end
