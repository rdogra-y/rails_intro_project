class City < ApplicationRecord
  belongs_to :country
  has_many :user_cities
  has_many :users, through: :user_cities

  validates :name, presence: true, uniqueness: true
  validates :temperature, presence: true, numericality: true
  validates :humidity, presence: true, numericality: { only_integer: true }
  validates :weather_condition, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
