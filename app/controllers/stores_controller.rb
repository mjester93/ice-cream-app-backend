class StoresController < ApplicationController
    skip_before_action :logged_in?, only: [:index, :show]

    def index
        stores = Store.all

        render json: stores.to_json(
            :except => [:created_at, :updated_at],
            :methods => [:ice_cream_count, :avg_rating]
        )
    end

    def show
        store = Store.find(params[:id])

        render json: store.to_json(
            :except => [:created_at, :updated_at],
            :include => {
                :ice_creams => {
                    :only => [:id, :flavor, :calories]
                },
                :reviews => {
                    :only => [:text, :rating, :photo],
                    :include => {
                        :user => {
                            :only => [:username, :location]
                        }
                    }
                }    
            }
        )
    end
end
