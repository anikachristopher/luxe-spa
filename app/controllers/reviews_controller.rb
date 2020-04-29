class ReviewsController < ApplicationController
    before_action :login_required

    def index
        @reviews = Review.all
    end
    
    def new
        @review = Review.new
        @review.appointment_id = params[:appointment_id]
    end

    def create
        @review = current_client.reviews.build(review_params)
        # binding.pry
        if @review.save
            redirect_to appointment_path(review_params[:appointment_id])
        else
            render :new
        end
    end

    def show
        @review = Review.find_by_id(params[:id])
    end

    def edit
        @review = Review.find(params[:id])
    end

    def update
        @review = Review.find(review_params[:id])
        @review.update(name: review_params[:name], content: review_params[:content]) #have to add name column to reviews table. may not work since name is not part of schema
        redirect_to review_path(@review) #review URL helpers 
    end

    private

    def review_params
        params.require(:review).permit(:content, :appointment_id)
    end
    


end
