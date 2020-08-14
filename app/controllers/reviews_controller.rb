class ReviewsController < ApplicationController

    def create 
        review = Review.new(review_parms)

        if review.valid?
            review.save
            render json: review
        else
            render json: {error: 'There is an error'}
        end
    end

    private

    def review_params
        params.permit(:user_id, :store_id, :text, :rating, :photo)
    end

end
