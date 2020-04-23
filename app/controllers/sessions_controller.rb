class SessionsController < ApplicationController
    # def new
    #     @client = Client.new
    #     render :login
    # end
    
    def home
    end

    def destroy
        session.clear
        redirect_to root_path
    end

end
