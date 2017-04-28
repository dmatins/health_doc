class RecordFieldsController < ApplicationController
  before_action :set_record_type
  before_action :set_record_field, only: [:show, :edit, :update, :destroy]

  # GET /record_fields
  # GET /record_fields.json
  def index
    @record_fields = @record_type.record_fields.all
  end

  # GET /record_fields/1
  # GET /record_fields/1.json
  def show
  end

  # GET /record_fields/new
  def new
    @record_field = @record_type.record_fields.new
  end

  # GET /record_fields/1/edit
  def edit
  end

  # POST /record_fields
  # POST /record_fields.json
  def create
    @record_field = @record_type.record_fields.new(record_field_params)

    respond_to do |format|
      if @record_field.save
        format.html { redirect_to @record_type, notice: 'Record field was successfully created.' }
        format.json { render :show, status: :created, location: @record_field }
      else
        format.html { render :new }
        format.json { render json: @record_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /record_fields/1
  # PATCH/PUT /record_fields/1.json
  def update
    respond_to do |format|
      if @record_field.update(record_field_params)
        format.html { redirect_to @record_type, notice: 'Record field was successfully updated.' }
        format.json { render :show, status: :ok, location: @record_field }
      else
        format.html { render :edit }
        format.json { render json: @record_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /record_fields/1
  # DELETE /record_fields/1.json
  def destroy
    @record_field.destroy
    respond_to do |format|
      format.html { redirect_to @record_type, notice: 'Record field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record_field
      @record_field = RecordField.find(params[:id])
    end

    def set_record_type
      @record_type = RecordType.find(params[:record_type_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_field_params
      params.require(:record_field).permit(:record_type_id, :name, :field_type, :position, allowed_values: [])
    end
end
