class SessionsController < ApplicationController

def welcome
end

def new 
    @user = User.new
end


def create 
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
    else
        redirect_to '/login'
    end
end

def destroy
    User.find(session[:user_id]).destroy      
    session[:user_id] = nil         
    redirect_to '/login' 
  end 


private 



end