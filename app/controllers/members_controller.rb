class MembersController < ApplicationController
  #before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_member, only: [:edit, :update]
  before_action :correct_member, only: [:edit, :update]
  # GET /members
  # GET /members.json
  def index
    @members = Member.all
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @member=Member.find(params[:id])
    @teches = @member.teches
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
       # @member = current_member
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)

      if @member.save
        login @member
        flash[:sucess]="Welcome to TechNet!"
        redirect_to new_members_tech_path :member_id => @member.id
      else
        redirect_to register_path :msg=> "p"#:error=> 3
        #render new
      end
  end
    
  
  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    #@member = Member.find(params[:id])
    if @member.update_attributes(member_params)
      #flash[:sucess]="Profile updated!"
      #redirect_to edit_profile_path :msg=> "s" # , flash[:sucess]="Profile updated!"
      #render 'edit' ,notice: "Profile updated!"
      new_tech_ids=params[:tech_ids]
     # mem_tech_ids=params[:tech_mem_ids]
      @mem_tech =MembersTech.where("member_id =?",current_member.id)
      #@member=current_member

      if new_tech_ids.present?
                MembersTech.delete_all(["member_id =?",current_member.id])
                 new_tech_ids.each do |tech|
                    @mem_tech = MembersTech.new(:member_id => current_member.id,:tech_id => tech)
                    @mem_tech.save
                  end
                #-----------------------------
                # if mem_tech_ids.present?
                # MembersTech.delete_all("member_id =?",current_member.id)
               #   mem_tech_ids.each do |tech|
               #      @mem_tech = MembersTech.new(:member_id => current_member.id,:tech_id => tech)
               #      @mem_tech.save
               #    end
               # end

      else
        if @mem_tech.present?
               MembersTech.delete_all("member_id =?",current_member.id)
          end 
            
          # if mem_tech_ids.present?
          #        MembersTech.delete_all("member_id =?",current_member.id)
          #        mem_tech_ids.each do |tech|
          #          @mem_tech = MembersTech.new(:member_id => current_member.id,:tech_id => tech)
          #          @mem_tech.save
          #         end 
          # else
          #     if @mem_tech.present?
          #         MembersTech.delete_all("member_id =?",current_member.id)
          #     end 
            
          # end
      end  
       redirect_to edit_profile_path :msg=> "s"
    else
      #render 'edit'
       redirect_to edit_profile_path :msg=> "p"
      
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_member
     # @member = current_member

      #@member = Member.find(params[:id])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:id, :username, :name, :lastname, :email, :password,:password_confirmation, :image_file, :experiences)
    end
    def logged_in_member
        #redirect_to login_path, notice: "Please login." unless logged_in?
        unless logged_in?
          flash[:notice]= "Please login."
          redirect_to login_path
        end
    end  

    def correct_member
      @member = current_member
      redirect_to(root_url) unless current_member?(@member)
    end
      
end
