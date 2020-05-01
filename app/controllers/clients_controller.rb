class ClientsController < ApplicationController

    # def index
    # end 

    def new
        @client = Client.new
    end

    def create
        @client = Client.new(client_params)
        if @client.save
            session[:client_id] = @client.id
            redirect_to @client
        else
            render :new
        end
    end

    def show
        redirect_if_not_logged_in
        @client = Client.find_by_id(params[:id])
       redirect_to '/' if !@client
    end

    private

    def client_params
        params.require(:client).permit(:first_name, :last_name, :email, :phone, :password)
    end
    

end
