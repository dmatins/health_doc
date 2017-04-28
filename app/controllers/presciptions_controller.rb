class PresciptionsController < ApplicationController
  before_action :set_patient
  before_action :set_presciption, only: [:show, :edit, :update, :destroy]

  # GET /presciptions
  # GET /presciptions.json
  def index
    @presciptions = @patient.presciptions
  end

  # GET /presciptions/1
  # GET /presciptions/1.json
  def show
  end

  # GET /presciptions/new
  def new
    @presciption = @patient.presciptions.new
  end

  # GET /presciptions/1/edit
  def edit
  end

  # POST /presciptions
  # POST /presciptions.json
  def create
    @presciption = @patient.presciptions.new(presciption_params)

    respond_to do |format|
      if @presciption.save
        format.html { redirect_to @patient, notice: 'Presciption was successfully created.' }
        format.json { render :show, status: :created, location: @presciption }
      else
        format.html { render :new }
        format.json { render json: @presciption.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presciptions/1
  # PATCH/PUT /presciptions/1.json
  def update
    respond_to do |format|
      if @presciption.update(presciption_params)
        format.html { redirect_to @patient, notice: 'Presciption was successfully updated.' }
        format.json { render :show, status: :ok, location: @presciption }
      else
        format.html { render :edit }
        format.json { render json: @presciption.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presciptions/1
  # DELETE /presciptions/1.json
  def destroy
    @presciption.destroy
    respond_to do |format|
      format.html { redirect_to patient_presciptions_url, notice: 'Presciption was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presciption
      @presciption = Presciption.find(params[:id])
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def presciption_params
      params.require(:presciption).permit(:patient_id, :physician_id, :medication, :quantity, :issue_date, :expiration_date, :renew_count, :called_in)
    end
end
