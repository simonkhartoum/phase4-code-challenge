class PowersController < ApplicationController
    def index
        powers = Power.all
        render json: powers
    end
    def show
       power =Power.find_by(id: params[:id])
        if power
          render json:power
        else
          render json: { error: "power not found" }, status: :not_found
        end
    end

    def update
        power = Power.find_by(id: params[:id])
        if power
          power.update(power_params)
          render json: power
        else
          render json: { error: "Power not found" }, status: :not_found
        end
    end
end
