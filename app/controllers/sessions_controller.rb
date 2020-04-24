class SessionsController < ApplicationController
    def new
    end
    
    def home
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    def create
        @client = Client.find_by(email: params[:client][:email])
        if @client && @client.authenticate(params[:client][:password])
            session[:client_id] = @client.id
            redirect_to @client
        else
            flash[:message] = "Hmm..That Doesn't Look Right. Please try again"
            redirect_to "/login"
        end
    end

    def destroy
        session.clear
        redirect_to '/'
    end

end
