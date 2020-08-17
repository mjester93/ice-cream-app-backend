class FavoriteStoresController < ApplicationController
    skip_before_action :logged_in?

    def create
        favorite_store = FavoriteStore.new(
            user_id: params[:user_id],
            store_id: params[:store_id]
        )

        byebug

        if favorite_store.valid?
            favorite_store.save
            render json: favorite_store
        else
            render json: {error: "there is an error"}
        end
    end


end
