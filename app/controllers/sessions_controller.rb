class SessionsController < ApplicationController

  def new
  end

  def create
    member = Member.find_by(username: params[:session][:username])
  
    if member && member.authenticate(params[:session][:password])
        login member
        redirect_to main_page_path 
        #redirect_back_or member
    else
      flash.now[:error] = 'Invalid username/password combination'
      redirect_to login_path
    end
  end
 
  def destroy
    logout
    redirect_to root_url
  end
end
