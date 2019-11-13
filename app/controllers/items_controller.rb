require 'rqrcode'

class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    redirect_to new_user_session_path and return if not current_user 
    @items = Item.where(group_id: current_user.groups.pluck(:id).uniq)

    # @items = Item.all
    @groups = current_user ? current_user.groups.map{ |g| g.id }.to_set : Set.new()
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @qr = RQRCode::QRCode.new("https://vast-savannah-03702.herokuapp.com/pay/#{params[:id]}")
    # puts @qr
  end

  def confirm
    @item = Item.find(params[:id])
    @qr = RQRCode::QRCode.new("https://vast-savannah-03702.herokuapp.com/confirm/#{params[:id]}")
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    redirect_to '/403' and return unless can_edit?
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    # @item.group = user.groups

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    
    redirect_to '/403' and return unless can_edit?

     
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    redirect_to '/403' and return unless can_edit?
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :desc, :price, :picture_url, :listed, :hidden, :group_id)
    end

    def can_edit?
      current_user && (current_user.groups.map{ |g| g.id}.to_set.include?(@item.group_id))
    end
end
