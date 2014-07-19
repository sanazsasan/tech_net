class MainControllerController < ApplicationController

  def register
  end

  def edit_profile
  end

  def login
  end

  def pass_recov
  end

  #def search
  #  @member=Member.where("username LIKE :prefix" , prefix: '%' + params[:member_search_text] +'%') 
  #end

  def main_page
    
    if params[:selected_tech]==nil
      @tech=Tech.first
      @relatedtech=@tech.peers
      @relatedcount =Assotech.where("peer_id =? or tech_id =?",@tech.id,@tech.id)
      #----------------------for using related techs with one peer------------------
      @relatedtechbasepeer =Assotech.where("peer_id =?",@tech.id)
    else
      @tmptech=Tech.find_by id: params[:selected_tech]
      @relatedtech=@tmptech.peers
      @asso_mem=@tmptech.members
      @relatedcount =Assotech.where("peer_id =? or tech_id =?",params[:selected_tech],params[:selected_tech])
     #----------------------for using related techs with one peer------------------
      @relatedtechbasepeer =Assotech.where("peer_id =?",params[:selected_tech])
    end
    
    #@member=selected_member
    if params[:selected_mem]==nil
      @member=current_member
      @current_member=current_member
    else
      @member=Member.find_by username: params[:selected_mem]
    end

    @teches = @member.teches
    @searched_member=Member.find(:all, :conditions => ['username LIKE ?' , "%#{params[:member_search_text]}%"])
    if @member.id == current_member.id
        @avgrate = Rate.find(:all, :conditions => {:rated_id => current_member.id})
        #@avgrate = Rate.find_by rated_id: current_member.id
        #-------------------------loop for average base current _member---------------------------------
        @c = 0
        @sum = 0
       
      if @avgrate.present?
         
          @avgrate.each do |rate|
            @sum = @sum + rate.score
            @c = @c + 1
         end

          @average = @sum / @c
      else
          @average =nil
      end
      #------------------------------------------loop for average base selected ember and current member------------------------------------------------
    else 
        # @avgrate = Rate.find_by rated_id: @member.id
         @avgrate = Rate.find(:all, :conditions => {:rated_id =>  @member.id})
         @rate =Rate.find_by rated_id: @member.id, rater_id: current_member.id
          @sum = 0
          @c = 0
         if @avgrate.present?
            @avgrate.each do |rate|
              @sum = @sum + rate.score
              @c = @c + 1
            end
            @average = @sum / @c
         else
            @average =nil
        end
         if @rate.present?
         @score =@rate.score 
        else
         @score=nil
         end
    end
    if params[:rating].present?
      rate_save
    end
  end
  
  def rate_save
   @ratecontrol =Rate.find_by rated_id: params[:memberid], rater_id: current_member.id
   if @ratecontrol.present?
        @ratecontrol.score =params[:rating]
       if @ratecontrol.save
          redirect_to main_page_path
      end
   else
       @rate =Rate.new
       @rate.rater_id =current_member.id
       @rate.rated_id =params[:memberid]
       @rate.score =params[:rating]
       if @rate.save
        redirect_to main_page_path
       end
  end

  end

  def prof_search
  end
end
