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
        @appointment = Appointment.find_by(title: review_params[:appointment_id])
        @review.appointment_id = @appointment.id
        if @review.save
            redirect_to appointment_path(@appointment.id)
        else
            render :new
        end
    end

    def show
        @review = Review.find_by_id(params[:id])
    end

    private

    def review_params
        params.require(:review).permit(:content, :appointment_id)
    end
    


end
