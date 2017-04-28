class RecordsController < ApplicationController
  before_action :set_patient
  before_action :set_record, only: [:show, :edit, :update, :destroy]

  # GET /records
  # GET /records.json
  def index
    @records = @patient.records
  end

  # GET /records/1
  # GET /records/1.json
  def show
    @record_history = @record.record_values.flat_map(&:versions).group_by{|v| v.created_at.strftime("%m/%d/%Y %H:%M")}.sort.reverse
  end

  # GET /records/new
  def new
    @record = @patient.records.new(record_type_id: params[:record_type_id])
  end

  # GET /records/1/edit
  def edit
  end

  # POST /records
  # POST /records.json
  def create
    @record = @patient.records.new(record_params)
    # t.integer  "patient_id"
    # t.boolean  "is_billed"
    # t.datetime "billed_date"
    # t.datetime "created_at",   null: false
    # t.datetime "updated_at",   null: false
    # t.index ["patient_id"], name: "index_invoices_on_patient_id"
    invoice = @record.build_invoice(patient_id: @record.patient_id, is_billed: false)


    respond_to do |format|
      if @record.save && invoice.save
        format.html { redirect_to @patient, notice: 'Record was successfully created.' }
        format.json { render :show, status: :created, location: @record }
        
      else
        format.html { render :new }
        format.json { render json: (@record.errors + invoice.errors), status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to @patient, notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to @patient, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def fields_for_record_type
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:patient_id, :record_type_id, :administered_at,
       record_values_attributes: [:id, :record_field_id, :value, :bool_value, :date_value, :file_name])
    end
end
