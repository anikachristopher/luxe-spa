class ServicesController < ApplicationController
    def index
        if params[:search]
            @services = Service.search_service(params[:search])
        else
            @services = Service.alpha
        end
    end

    def show
        @service = Service.find(params[:id])
    end



    private

    def service_params
        params.require(:service).permit(:service_name, :name, :duration, :cost, :description)
    end 

end
