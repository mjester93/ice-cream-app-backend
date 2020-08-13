class StoresController < ApplicationController

    def index
        stores = Store.all

        render json: stores.to_json(
            :except => [:created_at, :updated_at],
            :methods => [:ice_cream_count]
        )
    end

    def show

    end

end
