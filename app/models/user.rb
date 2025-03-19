class User < ApplicationRecord
    has_many :user_cities
    has_many :cities, through: :user_cities
  
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  end
  