class UsersController < ApplicationController
    skip_before_action :logged_in?

    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find(params[:id])

        render json: user.to_json(
            :include => {
                :favorite_stores => {
                    :include => [:store]
                },
                :reviews => {
                    :include => [:store]
                }
            }
        )
    end

    # this is to create a new account 
  
    def create
        user = User.new(user_params)

        if user.valid?
            user.save
            render json: {user: user, token: encode_token({user_id: user.id})}
        else
            render json: {error: "Failed to create the user"}
        end
    end

    # add a destroy method to delete account 

    private

    def user_params
        params.require(:user).permit(:username, :password, :location, :is_store_owner)
    end

end
