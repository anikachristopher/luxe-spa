class AppointmentsController < ApplicationController
    before_action :login_required
    before_action :find_appointment, only: [:show, :edit, :update]

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
            redirect_to appointment_path(@appointment.name)
        else
            render :new
        end
    end

    def show
    end                                            

    def edit
    end


    def update
        find_appointment.update(appointment_params)
        redirect_to appointment_path(@appointment) 
    end


    def destroy
        Appointment.find(params[:id]).destroy
        redirect_to client_path(current_client)
    end

    private

    def appointment_params
        params.require(:appointment).permit(:title, :date, :time, :service_id)
    end

    def find_appointment
        @appointment = Appointment.find(params[:id])
    end

end

