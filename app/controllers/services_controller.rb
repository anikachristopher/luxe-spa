class ServicesController < ApplicationController
    def index
        if params[:search]
            @services = Service.search_service(params[:search])
        else
            @services = Service.all.order(:name)
        end
    end

    def show
        @service = Service.find(params[:id])
    end



    private

    def service_params
        params.require(:service).permit(:name, :duration, :cost, :description)
    end 

end
