class ReviewsController < ApplicationController
    skip_before_action :logged_in?

    def create 
        review = Review.new(review_params)

        if review.valid?
            review.save
            render json: review.to_json(
                :only => [:text, :rating, :photo],
                :include => {
                    :user => {
                        :only => [:username, :location]
                    }
                }
            )
        else
            render json: {error: 'There is an error'}
        end
    end

    private

    def review_params
        params.require(:reviewData).permit(:user_id, :store_id, :text, :rating, :photo)
    end

end
