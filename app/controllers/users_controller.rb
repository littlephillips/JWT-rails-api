class UsersController < ApplicationController
    # create user, validate then create the token
    def create
        @user = User.create(user_params)

        if @user.valid?
            token =  encode_token({user_id: @user.id})
            render json: {user: @user, token: token}, status: :ok
        else
            render json: {errors: "Invalid username or password"}, status: :unprocessable_entity
        end
    end

    private
    def user_params
        params.permit(:username, :password)
    end
end