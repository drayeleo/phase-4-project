class Meal < ApplicationRecord
    belongs_to :restaurant
    has_many :user_meals
    has_many :users, through: :user_meals
end
