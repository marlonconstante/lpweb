class XreflendingsController < ApplicationController
  before_action :set_xreflending, only: [:show, :edit, :update, :destroy]

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

    respond_to do |format|
      if @xreflending.save
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
