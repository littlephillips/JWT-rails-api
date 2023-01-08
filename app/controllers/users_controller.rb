class UsersController < ApplicationController

    skip_before_action :authorized, only: [:create]
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    # def create
    #     @user = User.create(user_params)

    #     if @user.valid?
    #         token =  encode_token({user_id: @user.id})
    #         render json: {user: @user, token: token}, status: :ok
    #     else
    #         render json: {errors: "Invalid username or password"}, status: :unprocessable_entity
    #     end
    # end

    def create
        @user = User.create(user_params)
        render json: @user, status: :created
    end

    def index
        @user = User.find_by(current_user)
        if @user
            render json: @user
        else
            render json: {error: "Not authorized"}, status: :unauthorized
        end
    end

    def update 
        @user = User.find(params[:id])
        @user.update!(user_update_params)
        render json: @user, status: :created
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        head :no_content
    end


    # def login
    #     @user = User.find_by(username: user_params[:username])

    #     if @user && @user.authenticate(user_params[:password])
    #         token = encode_token({user_id: @user.id})
    #         render json: {user: @user, token: token}, status: :ok
    #     else
    #         render json: {error: "Invalid username or password"}, status: :unprocessable_entity
    #     end
    # end

    private
    def user_params
        params.permit(:username, :email, :password)
    end

    def authorize
        return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    end

    def user_update_params
        params.permit(:username, :email)
    end

    def render_not_found_response
        render json: { error: "Power Not found" }, status: :unprocessable_entity
    end

end
