class FoodsController < ApplicationController

    def index
        @foods = current_user.foods

        render json: @foods
    end

    def show
        @food = Food.find_by(id: params[:id])

        render json: @food
    end

    def create
        @food = current_user.foods.create(food_params)

        render json: @food
    end

    def update
        @food = Food.find_by(id: params[:id])
        @food.update(food_params)

        render json: 'Successfully Updated'
    end

    def destroy
        @food = Food.find_by(id: params[:id])
        @food.destroy

        render json: 'Successfully Deleted'
    end

    private

    def food_params
        params.permit(:food_name, :expiration_date, :quantity, :quantity_unit, :value, :food_category, :user_id)
    end

end