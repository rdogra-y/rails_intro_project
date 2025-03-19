class CountriesController < ApplicationController
    def index
      @countries = Country.page(params[:page]).per(10)  # Show 10 countries per page
      @countries = Country.where("name ILIKE ?", "%#{params[:query]}%") if params[:query].present?  
    end
  end
  