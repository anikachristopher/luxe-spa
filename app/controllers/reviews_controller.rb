class ReviewsController < ApplicationController
    before_action :login_required

    def new
        @review = Review.new
    end

    def create
        @review = current_client.reviews.build(review_params)
        if @review.save
            redirect_to appointment_path
        else
            render :new
        end
    end

    private

    def review_params
        params.require(:review).permit(:content)
    end
    


end
