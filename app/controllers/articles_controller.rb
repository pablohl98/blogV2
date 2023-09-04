class ArticlesController < ApplicationController

    def index
      @articles = Article.all.order(updated_at: :desc)
    end

    def show
        @article = Article.find(params[:id])
    end
    
    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)

        if @article.save
            redirect_to '/articles', notice: 'Tu producto se ha creado correctamente'
        else
            render :new, status: :unprocessable_entity
        end
    end
    def edit
        @article = Article.find(params[:id])
    end
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            redirect_to '/articles', notice: 'Tu producto se ha actualizado correctamente'

        else
            render :edit, status: :unprocessable_entity
        end


    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to '/articles', notice: 'Tu producto se ha eliminado correctamente', status: :see_other
    end

    private
    def article_params
        params.require(:article).permit(:title, :content, :author_id, :category_id, :image)
    end

end