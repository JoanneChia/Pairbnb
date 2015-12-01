class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  # before_action :logged_in_user, only: [:create, :destroy]
  # before_action :correct_user,   only: :destroy

  # GET /listings
  # GET /listings.json
  def index
    # @user = current_user
    @listings = Listing.all
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @listing = Listing.find(params[:id])
    @all_listings = current_user.listings
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save!
 # Sends email to user after listing has been created     
  ExampleMailer.listing_confirmation(@listing).deliver_now     
      redirect_to listings_path
    else 
      render new
    # respond_to do |format|
    #   if @listing.save
    #     format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
    #     format.json { render :show, status: :created, location: @listing }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @listing.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    if current_user == @listing.user
      @listing.destroy
      redirect_to listings_path
    else 
      redirect_to listings_path
    end
    # respond_to do |format|
    #   format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
    #   format.json { head :no_content }
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:name, :price, :description, :image)
    end

    # def correct_user
    #   @listing = current_user.image.find_by(id: params[:id])
    #   redirect_to root_url if @listing.nil?
    # end

end
