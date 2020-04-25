class ServicesController < ApplicationController
    def index
        @service = Service.all
    end

    def new
        @service = Service.new
    end

    def create
         @review = current_client.reviews.build(review_params)
        if @review.save
            redirect_to appointment_path
        else
            render :new
        end
    end

    def edit
        @service = Service.find(params[:id])
    end

    def update
        #raise params.inspect
        @service = Service.find(params[:id])
        @service.update(title: params[:service][:name], cost: params[:service][:cost])
        redirect_to service_path(@service)
    end

    def show
        @service = Service.find_by_id(params[:id])
    end


    def destroy 
        Service.find(params[:id]).destroy
        redirect_to client_path(current_client)
    end 

    private

    def service_params
        params.require(:service).permit(:name, :duration, :cost)
    end 

end
