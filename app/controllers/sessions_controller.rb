class SessionsController < ApplicationController
    def new
    end
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "loginsuccessfuly"
            redirect_to user
        else
            flash.now[:alert] = 'wrong email or password'
            render 'new'
        end
    end
    def destory
        session[:user_id] = nil
        flash[:notice] = "logged out"
        redirect_to root_path
    end

end