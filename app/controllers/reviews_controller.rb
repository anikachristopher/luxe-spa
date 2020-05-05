class ReviewsController < ApplicationController
    before_action :login_required

    def index
        @reviews = Review.all
    end
    
    def new
        @review = Review.new
        @review.appointment_id = params[:appointment_id]
        client_appointments
    end

    def create
        @review = current_client.reviews.build(review_params)
            if @review.save
            redirect_to reviews_path
        # @review = current_client.reviews.build(review_params)
        # @appointment = Appointment.find_by(title: review_params[:appointment_id])
        # @review.appointment_id = @appointment.id
        # if @review.save
            redirect_to reviews_path
        else
            render :new
        end
    end


    def destroy
        Review.find(params[:id]).destroy
        redirect_to review_path
    end


    private

    def review_params
        params.require(:review).permit(:name, :title, :content, :appointment_id)
    end
    


end
