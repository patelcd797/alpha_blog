class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show 
    end
    def index
        @articles = Article.all
    end
    def new 
        @article = Article.new
    end

    def edit
    end
    def create
        @article = Article.new(article_param)
        @article.user = User.first
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
end