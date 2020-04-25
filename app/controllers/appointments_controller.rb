class AppointmentsController < ApplicationController
    before_action :login_required

    def new
        @appointment = Appointment.new
    end

    def create
        @appointment = current_client.appointments.build(appointment_params)
        if @appointment.save
            redirect_to appointment_path
        else
            render :new
    end

    def show
        @appointment = Appointment.find_by_id(params[:id])
    end

    def edit
        @review = Review.find(params[:id])
    end

    def update
        @appointment = Appointment.find(params[:id])
        @appointment.update(title: params[:service][:date], cost: params[:service][:time])
        redirect_to appointment_path(@appointment)
    end

    def destroy
    end

    private

end
