class StoresController < ApplicationController

    def index
        stores = Store.all

        render json: stores.to_json(
            :except => [:created_at, :updated_at]
        )
    end

    def show

    end

end
