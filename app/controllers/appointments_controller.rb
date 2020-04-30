class AppointmentsController < ApplicationController
    before_action :login_required

    def index
        @appointments = current_client.appointments
    end

    def new
        @appointment = Appointment.new
    end

    def create
        @appointment = current_client.appointments.build(appointment_params)
        @service = Service.find_by(name: appointment_params[:service_id])
        @appointment.service_id = @service.id
        if @appointment.save
            redirect_to appointment_path(@appointment.id)
        else
            render :new
        end
    end

    def show
        @appointment = Appointment.find(params[:appointment_id])
    end

    def edit
        binding.pry
        @appointment = Appointment.find(params[:id])
    end

    def update
        @appointment = Appointment.find(params[:id])
        @appointment.update(title: params[:appointment][:name], description: params[:appointment][:description])
        redirect_to appointments_path(@appointment)
    end


    def destroy
        Appointment.find(params[:id]).destroy
        redirect_to client_path(current_client)
    end

    private

    def appointment_params
        params.require(:appointment).permit(:title, :date, :time, :service_id)
    end

end


# def edit
#     if current_client
#       @appointment = current_client.appointments.find_by(id:params[:id])
#       redirect_to client_appointments_path(@client) if !@appointment
#     else
#       redirect_to clients_path, alert: "Client not found"
#     end
#   end

#   def update 
#     @appointment = Appointment.find(params[:id])
#     @appointment.update(appointment_params)
#     if @appointment.save
#       redirect_to @appointment
#     else
#       render :edit
#     end