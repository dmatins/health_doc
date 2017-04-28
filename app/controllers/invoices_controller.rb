class InvoicesController < ApplicationController
  before_action :set_patient
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  

  def index
    if @patient
      # GET /patient/{id}/invoices
      # GET /patient/{id}/invoices.json
      @invoices = @patient.invoices;
    else
      # GET /invoices
      # GET /invoices.json  
      @invoices = Invoice.all
    end
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show    
  end

  # GET /invoices/new
  def new
    @invoice = @patient.invoices.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = @patient.invoices.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @patient, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @patient, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    def set_patient
      @patient = Patient.find_by(id: params[:patient_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:patient_id, :service_date, :is_billed, :billed_date, record_ids: [])
    end
end
