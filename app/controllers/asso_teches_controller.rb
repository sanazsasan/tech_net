class AssotechesController < ApplicationController
  before_action :set_asso_tech, only: [:show, :edit, :update, :destroy]

  # GET /asso_Teches
  # GET /asso_Teches.json
  def index
    @asso_teches = AssoTech.all
  end

  # GET /asso_Teches/1
  # GET /asso_Teches/1.json
  def show
  end

  # GET /asso_Teches/new
  def new
    @asso_tech = AssoTech.new
  end

  # GET /asso_Teches/1/edit
  def edit
  end

  # POST /asso_Teches
  # POST /asso_teches.json
  def create
    @asso_tech = AssoTech.new(asso_tech_params)

    respond_to do |format|
      if @asso_tech.save
        format.html { redirect_to @asso_tech, notice: 'Asso tech was successfully created.' }
        format.json { render action: 'show', status: :created, location: @asso_tech }
      else
        format.html { render action: 'new' }
        format.json { render json: @asso_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asso_teches/1
  # PATCH/PUT /asso_teches/1.json
  def update
    respond_to do |format|
      if @asso_tech.update(asso_tech_params)
        format.html { redirect_to @asso_tech, notice: 'Asso tech was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @asso_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asso_teches/1
  # DELETE /asso_teches/1.json
  def destroy
    @asso_tech.destroy
    respond_to do |format|
      format.html { redirect_to asso_teches_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asso_tech
      @asso_tech = AssoTech.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asso_tech_params
      params.require(:asso_tech).permit(:tech_id, :peer_id)
    end
end
