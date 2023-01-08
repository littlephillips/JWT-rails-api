class SessionsController < ApplicationController
    # require 'byebug'

    def index 
        # byebug
        @user = User.all 
        render json: @user
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user &.authenticate(params[:password])
            session[:user_id] = user.id
            render json: @user, Serializer: SessionSerializer
        else
            render json: { errors: "Invalid email or password" }, status: :unauthorized
        end
    end
end
