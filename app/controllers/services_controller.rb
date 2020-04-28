class ServicesController < ApplicationController
    def index
        @services = Service.all
    end

    # def new
    #     @service = Service.new
    # end

    # def create
    #      @service = current_client.services.build(service_params)
    #     if @service.save
    #         redirect_to appointment_path
    #     else
    #         render :new
    #     end
    # end

    # def edit
    #     @service = Service.find(params[:id])
    # end

    # def update
    #     #raise params.inspect
    #     @service = Service.find(params[:id])
    #     @service.update(title: params[:service][:name], cost: params[:service][:cost])
    #     redirect_to service_path(@service)
    # end

    def show
        # @services = Service.all
        @service = Service.find_by_id(params[:id])
    end

    private

    def service_params
        params.require(:service).permit(:name, :duration, :cost)
    end 

end
