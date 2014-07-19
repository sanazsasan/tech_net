class MembersTechesController < ApplicationController
  before_action :set_members_tech, only: [:show, :edit, :update, :destroy]

  # GET /members_teches
  # GET /members_teches.json
  def index
    @members_teches = MembersTech.all
  end

  # GET /members_teches/1
  # GET /members_teches/1.json
  def show
  end

  # GET /members_teches/new
  def new
    @members_tech = MembersTech.new
  end

  # GET /members_teches/1/edit
  def edit
  end

  # POST /members_teches
  # POST /members_teches.json
  def create

#    @members_tech = MembersTech.new(members_tech_params)
#mem_tech=params[:members_tech]
w=params[:members_tech][:tech_id]
m=params[:members_tech][:member_id]
#tech=@w.tech_id
#params[:member_id].each do |mt|
#mem=mt.tech_id
#techs=mem_tech.member_id
if w.present?
    w.each do |tech|
      @members_tech = MembersTech.new(:member_id => m,:tech_id => tech)
      @members_tech.save
    end
     #params.require(:employer).permit(:name, { :employer_ids => [] })

   respond_to do |format|
      if @members_tech.save
          format.html do
           return redirect_to main_page_path 
              #, notice:  m
          end
      else
        #format.html { render action: 'new' }
        #format.json { render json: @members_tech.errors, status: :unprocessable_entity }
        redirect_to new_members_tech_path :member_id => @member.id
      end
    end
  end
else
   return redirect_to main_page_path 
   # , notice:  m

end    

   
  # PATCH/PUT /members_teches/1
  # PATCH/PUT /members_teches/1.json
  def update
    respond_to do |format|
      if @members_tech.update(members_tech_params)
        format.html { redirect_to @members_tech, notice: 'Members tech was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @members_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members_teches/1
  # DELETE /members_teches/1.json
  def destroy
    @members_tech.destroy
    respond_to do |format|
      format.html { redirect_to members_teches_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_members_tech
      @members_tech = MembersTech.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def members_tech_params
    #  params.require(:members_tech).permit(:member_id, :tech_id, :integer)
    params.require(:members_tech).permit(:member_id,   { :tech_id => [] } )
    end
end
