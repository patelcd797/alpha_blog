class UsersController < ApplicationController 
    def new 
        @user = User.new
    end

    def index
        @users = User.paginate(page: params[:page], per_page: 3)
    end
    def edit
        @user = User.find(params[:id])
    end

    def show
        @user = User.find(params[:id])
        @articles =  @user.articles.paginate(page: params[:page], per_page: 3)
    end

    def create
       
        @user = User.new(user_param)
        
        if @user.save
            flash[:notice] = "user created successfull"
            redirect_to articles_path
        else 
            render 'new'
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_param)
            flash[:notice] = "user updatedsuccessfuly"
            redirect_to @user
        else
            render 'edit'
        end 
    end


    private
    def user_param 
        params.require(:user).permit(:name, :email, :password)
    end
end
