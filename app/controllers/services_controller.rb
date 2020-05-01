class ServicesController < ApplicationController
    def index
        @services = Service.alpha
    end

    def show
        @service = Service.find(params[:id])
    end

    private

    def service_params
        params.require(:service).permit(:name, :duration, :cost, :description)
    end 

end
