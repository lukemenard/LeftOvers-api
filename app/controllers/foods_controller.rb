class FoodsController < ApplicationController

    def index
        @foods = current_user.foods

        render json: @foods
    end
end
