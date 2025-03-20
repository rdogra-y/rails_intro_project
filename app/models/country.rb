class Country < ApplicationRecord
    has_many :cities
    has_one :air_quality
  
    validates :name, presence: true, uniqueness: true
    validates :capital, presence: true
    validates :population, numericality: { greater_than: 0 }
    validates :currency, presence: true
    validates :latitude, presence: true
    validates :longitude, presence: true
  end
  