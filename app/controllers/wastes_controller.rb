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
        
    end
end
