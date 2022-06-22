class User < ApplicationRecord
  has_many :user_meals
  has_many :meals, through: :user_meals

  has_secure_password
end
