class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :require_user, expect: [:show, :index] 
    before_action :require_same_user , only: [:edit, :update, :destory]

    def show 
    end
    def index
        @articles = Article.paginate(page: params[:page], per_page: 3)
    end
    def new 
        @article = Article.new
    end

    def edit
    end

    def create
        @article = Article.new(article_param)
        @article.user = current_user
        if @article.save
            flash[:notice] = "article created successfull"
            redirect_to @article
        else 
            render 'new'
        end
    end
    def update
        
        if @article.update(article_param)
            flash[:notice] = "Article updated successfully"
            redirect_to @article
        else
            render "edit"
        end
    end

    def destroy
        @article.destroy
        redirect_to article_path
    end

    private
     def set_article
        @article = Article.find(params[:id])
     end 
     def article_param
        params.require(:article).permit(:title, :description)
     end
     def require_same_user 
        if current_user != @article.user && !current_user.admin?
            flash[:notice] =  "you can only  view the article"
            redirect_to @article
        end
     end
end