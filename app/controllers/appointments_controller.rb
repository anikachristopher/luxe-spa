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
        # binding.pry
        @appointment.service_id = @service.id
        if @appointment.save
            redirect_to appointment_path(@appointment.id)
        else
            render :new
        end
    end

    def show
        find_appointment #@appointment = Appointment.find(params[:id]) #build helper method for line 25, 29, 33 and put it in private method.
    end                                                #use macro before_action (delete duplicated lines)

    def edit
        find_appointment #@appointment = Appointment.find(params[:id]) #storing the appointment record in an instance variable
    end

    def update
        find_appointment #Querying the database for the appointment record that matches the id passed to the route. Stores the query in an inst var.
        @appointment.update(title: params[:appointment][:title], date: params[:appointment][:date], time: params[:appointment][:time]) #Update the values passed from the form taking a hash of attributes for the model as its argument. Save the changes in the database.
        redirect_to appointments_path(@appointment) #Redirect user to the show page so they could see the updated record.
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

