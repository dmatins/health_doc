class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user
  after_action :verify_authorized

  # The index command is used to get the list of all appointments in the system and assign it
  # to @appointments for use in the view's logic.
  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.all
    @appointments = @appointments.between_dates(params[:start].to_time, params[:end].to_time) if params[:start] and params[:end]
  end

  # The show command is used to get the appointment we're interested in for use in the view.
  # Helpfully, the before_action command above causes set_appointment to be executed right
  # before show, and set_appointment takes care of what we'd normally do in show - assigning
  # @appointment to the relevant appointment.  So this is just an empty dummy method.
  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # We create a new appointment model and select it for use in the view.
  # GET /appointments/new
  def new
    @appointment = Appointment.new(start_time: params[:start_time], end_time: params[:end_time])
  end

  # Another empty dummy method - see show above.
  # GET /appointments/1/edit
  def edit
  end

  # Create a new appointment with the specified parameters from the view and render in html or json
  # format, depending on what is requested (if an error did not occur).
  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # Update our selected appointment in the database with the information from the view, again
  # rendering in html or json format depending on what is requested.
  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # Delete our appointment from the database and notify the user of such.
  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # We use callbacks to share common setup or constraints between actions - this method will always be executed right before
    # show, edit, update, and destroyed (see above) so that we avoid repeating ourselves in those methods.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def authorize_user
      if @appointment
        authorize @appointment
      else
        authorize Appointment
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:patient_id, :physician_id, :start_time, :end_time, :record_type_id, :name, :description)
    end
end
