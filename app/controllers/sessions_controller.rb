class SessionsController < ApplicationController
    def new
    end
    
    def home
    end


    def create
        if 
            @client = Client.find_by(email: params[:client][:email])
            @client && @client.authenticate(params[:client][:password])
                session[:client_id] = @client.id
                redirect_to @client
            else
                # flash[:message] = "Hmm..That Doesn't Look Right. Please try again"
                redirect_to "/login"
        end
    end




    def google
        @client = Client.find_or_create_by(email: auth["info"]["email"]) do |client|
            client.first_name = auth["info"]["first_name"]
            client.last_name = auth["info"]["last_name"]
            client.password = SecureRandom.hex    
        end

        if @client.save
        session[:client_id] = @client.id
        redirect_to client_path(@client)
        else
            redirect_to login_path
        end
    end


    def destroy
        session.clear
        redirect_to '/'
    end

    private

    def auth
        request.env['omniauth.auth']
    end
    
end
