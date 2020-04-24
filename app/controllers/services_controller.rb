class ServicesController < ApplicationController
    def index
        @service = Service.all
    end

    def new
        @service - Service.new
    end

    def create
    @service = Service.new(service_params)
        if @service.save
            render :show
        else
            render :new
        end
    end

    def edit
        @service = Service.find(params[:id])
    end

    def update
    end

    def show
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
