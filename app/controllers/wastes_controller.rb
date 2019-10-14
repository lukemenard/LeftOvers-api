class WastesController < ApplicationController
    def index
        @wastes = current_user.wastes

        render json: @wastes
    end

    def show
        @waste = Food.find_by(id: params[:id])

        render json: @waste
    end

    def create
        @food_conversion_rate = Food.find_by(id: params[:id]).conversion_rate
        @quantity = params[:quantity].to_f
        @cost = @quantity * @food_conversion_rate
        @waste = current_user.wastes.new(waste_params)
        @waste.cost = @cost
        @waste.save

        # byebug

        render json: @waste
    end

    private 

    def waste_params
        params.permit(:food_name, :expiration_date, :quantity, :quantity_unit, :value, :food_category, :id, :disposal_method, :disposal_reason)
    end
end
