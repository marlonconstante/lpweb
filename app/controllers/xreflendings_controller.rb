class XreflendingsController < ApplicationController
  before_action :set_xreflending, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /xreflendings
  # GET /xreflendings.json
  def index
    @xreflendings = Xreflending.all
  end

  # GET /xreflendings/1
  # GET /xreflendings/1.json
  def show
  end

  # GET /xreflendings/new
  def new
    @xreflending = Xreflending.new
  end

  # GET /xreflendings/1/edit
  def edit
  end

  # POST /xreflendings
  # POST /xreflendings.json
  def create
    
    @xreflending = Xreflending.new(xreflending_params)
    
    form_lend_date = params[:xreflending][:lend_date]
    form_return_date = params[:xreflending][:return_date]
    form_equipment_id = params[:xreflending][:equipment_id]
    
    # Valida se a data de empréstimo é maior que a data de retorno
    if form_lend_date >= form_return_date
      validation_error = true
      @xreflending.errors[:base] << ("Data de retorno deve ser maior que a data de empréstimo.")
    end
    
    # Busca se existe algum agendamento para este equipamento no mesmo intervalo de tempo
    if Xreflending.where('equipment_id = ? AND ((lend_date <= ?)  AND  (return_date >= ?))', form_equipment_id, form_return_date, form_lend_date)
      validation_error = true
      @xreflending.errors[:base] << "Já existe um agendamento no intervalo de tempo informado."
    end

    respond_to do |format|
      if !validation_error
        save_result = @xreflending.save
      end
      
      if !validation_error && save_result
        format.html { redirect_to @xreflending, notice: 'Xreflending was successfully created.' }
        format.json { render :show, status: :created, location: @xreflending }
      else
        format.html { render :new }
        format.json { render json: @xreflending.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /xreflendings/1
  # PATCH/PUT /xreflendings/1.json
  def update
    respond_to do |format|
      if @xreflending.update(xreflending_params)
        format.html { redirect_to @xreflending, notice: 'Xreflending was successfully updated.' }
        format.json { render :show, status: :ok, location: @xreflending }
      else
        format.html { render :edit }
        format.json { render json: @xreflending.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /xreflendings/1
  # DELETE /xreflendings/1.json
  def destroy
    @xreflending.destroy
    respond_to do |format|
      format.html { redirect_to xreflendings_url, notice: 'Xreflending was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_xreflending
      @xreflending = Xreflending.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def xreflending_params
      params.require(:xreflending).permit(:equipment_id, :employee_id, :lend_date, :return_date)
    end
end
