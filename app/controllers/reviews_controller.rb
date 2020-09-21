class ReviewsController < ApplicationController
    skip_before_action :logged_in?

    def create 

        review = Review.new(review_params)
        review.avatar.attach(params[:photo])

        if review.valid?
            review.save

            review.update(photo: url_for(review.avatar))

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

    # add a destroy method to delete review 

    private

    def review_params
        params.permit(:user_id, :store_id, :text, :rating, :photo)
    end

end
