class SessionsController < ApplicationController
    def new
    end
    
    def home
    end

    # def destroy
    #     session.clear
    #     redirect_to root_path
    # end

    def create
        if auth_hash = request.env["omniauth.auth"]
        oauth_email = request.env["omniauth.auth"]["email"]
        end
        
        if client = Client.find_by(:email => oauth_email)
            session[:client_id] = @client.id
        else
            client = Client.create(:email => oauth_email)
            session[:client_id] = @client.id
        end

        else
            @client = Client.find_by(email: params[:client][:email])
        if @client && @client.authenticate(params[:client][:password])
            session[:client_id] = @client.id
            redirect_to @client
        # else
        #     flash[:message] = "Hmm..That Doesn't Look Right. Please try again"
        #     redirect_to "/login"
        end
    end

    def google
        @client = Client.find_or_create_by(email: auth["info"]["email"]) do |client|
            client.first_name = auth["info"]["first_name"]
            client.last_name = auth["info"]["last_name"]
            client.password = SecureRandom.hex    
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
