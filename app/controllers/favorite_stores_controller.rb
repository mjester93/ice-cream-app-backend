class FavoriteStoresController < ApplicationController
    skip_before_action :logged_in?

    def create
        favorite_store = FavoriteStore.new(
            user_id: params[:user_id],
            store_id: params[:store_id]
        )

        if favorite_store.valid?
            favorite_store.save
            render json: favorite_store
        else
            render json: {error: "there is an error"}
        end
    end

    def is_user_favorite
        favorite_store = FavoriteStore.find_by(user_id: params[:user_id], store_id: params[:store_id])

        if (!favorite_store.nil?)
            render json: {result: true}
        else
            render json: {result: false}
        end
    end

    def delete_favorite_store
        favorite_store = FavoriteStore.find_by(user_id: params[:user_id], store_id: params[:store_id]).destroy
    end
end
