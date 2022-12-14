class UsersController < ApplicationController 
    before_action :set_user, only: [:edit,:show,:update, :destroy]
    before_action :require_user, only: [:edit, :update]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def new 
        @user = User.new
    end

    def index
        @users = User.paginate(page: params[:page], per_page: 3)
    end
    def edit  
    end

    def show
        @articles =  @user.articles.paginate(page: params[:page], per_page: 3)
    end

    def create
       
        @user = User.new(user_param)
        
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "user created successfull"
            redirect_to articles_path
        else 
            render 'new'
        end
    end

    def update
        if @user.update(user_param)
            flash[:notice] = "user updatedsuccessfuly"
            redirect_to @user
        else
            render 'edit'
        end 
    end

    def destroy 
        @user.destroy
        session[:user_id] = nil if @user == current_user
        flash[:notice] = "account deleted with all the articles associated with it"
        redirect_to articles_path
    end

    private
    def user_param 
        params.require(:user).permit(:name, :email, :password)
    end
    def set_user 
        @user = User.find(params[:id])
    end
    def require_same_user 
        if current_user != @user && !current_user.admin?
            flash[:notice] =  "you can only edit or delte your own account"
            redirect_to @user
        end
     end
end
