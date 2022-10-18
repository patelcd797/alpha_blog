class CategoriesController < ApplicationController 
    before_action :required_admin, except: [:index, :show]
    def show
        @category = Category.find(params[:id])
        @articles = @category.articles.paginate(page: params[:page], per_page:4)
    end
    def index 
        @categories = Category.paginate(page: params[:page], per_page: 5)
    end

    def new 
        @category = Category.new
    end

    def edit
        @category = Category.find(params[:id])
    end

    def update
        @category = Category.find(params[:id])
        if @category.update(category_params)
            flahs[:notice] = "category updated successfull"
            redirect_to @category
        else 
            flash[:alert] = "some error occurs please try again"
            render 'edit'
        end
    end

    def create
        @category = Category.new(category_params)

        if @category.save
            flash[:notice] = "category was successfully created"
            redirect_to @category
        else
            render 'new'
        end

    end

    private 
    def category_params 
        params.require(:category).permit(:name)
    end

    def required_admin
        if !(logged_in? && current_user.admin?)
            flash[:alert] = "Only admin can perform this action"
            redirect_to categories_url
        end
    end
end