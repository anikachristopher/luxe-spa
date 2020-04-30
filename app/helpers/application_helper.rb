module ApplicationHelper
    def current_client
        @current_client ||= Client.find_by_id(session[:client_id]) if session[:client_id]
     end

    def is_logged_in?
        !!session[:client_id]
    end

    def login_required
        unless is_logged_in?
            flash[:error] = "Hmm...Seems Like You're Not Logged In. Log In to Book an Appointment"
            redirect_to login_path
        end
    end

    def client_appointments
        current_client.appointments
    end


    def redirect_if_not_logged_in
        redirect_to '/' if !is_logged_in?
      end 
end

