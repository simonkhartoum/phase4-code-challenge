class HeroPowersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid , with: :render_unprocessable_entity
    def create
        hero_power = HeroPower.create!(hero_power_params)
        hero = Hero.find(params[:hero_id])
        render json: hero, include: :powers, status: :created
    end
    private
    def hero_power_params
        params.permit(:strength, :power_id, :hero_id)
    end
    def render_unprocessable_entity(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
