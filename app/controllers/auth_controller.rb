class AuthController < ApplicationController
    skip_before_action :logged_in?, only: [:create] #login

    def create
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            render json: {user: user, token: encode_token({user_id: user.id})}
        else
            render json: {error: "Invalid username or Password"}
        end
    end

end

# this is for logging in with password and keeping is secure! 