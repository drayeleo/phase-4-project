class UserMealsController < ApplicationController

    def show
        user = User.find(params[:id])
        render json: user, serializer: UserSerializer
    end

    def create
        usermeal = UserMeal.create!(user_meals_params)
        render json: usermeal, include: ['meal', 'meal.restaurant'], status: :created
    end

    def destroy
        usermeal = UserMeal.find_by(user_id: params[:id], meal_id: params[:meal_id])
        if usermeal
            usermeal.destroy
        end
        head :no_content
    end
    
    def last_meals
        lastmeal = UserMeal.order("created_at").last
        if lastmeal
            lastmeal.destroy
        end
        head :no_content
    end


    private

    def user_meals_params
        params.permit(:user_id, :meal_id)
    end
end
