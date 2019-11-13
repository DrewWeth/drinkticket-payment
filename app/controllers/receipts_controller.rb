class ReceiptsController < ApplicationController
  before_action :set_receipt, only: [:show, :edit, :update, :destroy]

  # GET /receipts
  # GET /receipts.json
  def index
    @receipts = current_user ? current_user.receipts : []
  end

  # GET /receipts/1
  # GET /receipts/1.json
  def show
    redirect_to '/403' and return unless can_edit?
  end

  # GET /receipts/new
  def new
    redirect_to '/403' unless is_admin
    @receipt = Receipt.new
  end

  # GET /receipts/1/edit
  def edit
    redirect_to '/403' and return unless is_admin
  end

  # POST /receipts
  # POST /receipts.json
  def create
    redirect_to '/403' and return unless is_admin
    @receipt = Receipt.new(receipt_params)

    respond_to do |format|
      if @receipt.save
        format.html { redirect_to @receipt, notice: 'Receipt was successfully created.' }
        format.json { render :show, status: :created, location: @receipt }
      else
        format.html { render :new }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receipts/1
  # PATCH/PUT /receipts/1.json
  def update
    redirect_to '/403' and return unless is_admin
    respond_to do |format|
      if @receipt.update(receipt_params)
        format.html { redirect_to @receipt, notice: 'Receipt was successfully updated.' }
        format.json { render :show, status: :ok, location: @receipt }
      else
        format.html { render :edit }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipts/1
  # DELETE /receipts/1.json
  def destroy
    redirect_to '/403' and return unless is_admin
    @receipt.destroy
    respond_to do |format|
      format.html { redirect_to receipts_url, notice: 'Receipt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt
      @receipt = Receipt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receipt_params
      params.require(:receipt).permit(:user_id, :status, :user_email, :amount, :payer_id, :pay_source, :pay_source_status, :data)
    end

    def can_edit?
      current_user && current_user.receipts.pluck(:id).to_set.include?(params[:id].to_i)
    end
end
