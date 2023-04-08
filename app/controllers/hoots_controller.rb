class HootsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_hoot, only: %i[ show edit update destroy ]

  # GET /hoots or /hoots.json
  def index
    @hoot = Hoot.new(user: current_user)
    @hoots = Hoot.all
  end

  # GET /hoots/1 or /hoots/1.json
  def show
  end

  # GET /hoots/new
  def new
    @hoot = Hoot.new
  end

  # GET /hoots/1/edit
  def edit
  end

  # POST /hoots or /hoots.json
  def create
    @hoot = Hoot.new(hoot_params.merge(user: current_user))
    respond_to do |format|
      if @hoot.save
        format.html { redirect_to hoot_url(@hoot), notice: "Hoot was successfully created." }
        format.json { render :show, status: :created, location: @hoot }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hoot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hoots/1 or /hoots/1.json
  def update
    respond_to do |format|
      if @hoot.update(hoot_params)
        format.html { redirect_to hoot_url(@hoot), notice: "Hoot was successfully updated." }
        format.json { render :show, status: :ok, location: @hoot }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hoot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hoots/1 or /hoots/1.json
  def destroy
    @hoot.destroy

    respond_to do |format|
      format.html { redirect_to hoots_url, notice: "Hoot was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hoot
      @hoot = Hoot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hoot_params
      params.require(:hoot).permit(:body)
    end
end
