class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @member =Member.find_by email: params[:email]
    @member.send_password_reset if @member
    redirect_to root_url, :notice => "Email sent with password reset instructions."
  end
  
  def edit
    @member = Member.find_by_password_reset_token!(params[:id])
  end
  
  def update
    @member = Member.find_by_password_reset_token!(params[:id])
    if @member.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Password reset has expired."
    else 
       if  @member.update_attributes(member_params)
   #   @member.password =params[:password]
   #   @member.password_confirmation =params[:password_confirmation]
   #   if @member.save
        redirect_to root_url, :notice => "Password has been reset!"
      else
        render :edit
      end
    end
  end

  def member_params
      params.require(:member).permit(:id,:password,:password_confirmation)
    end
end
