class ArticlesController < ApplicationController

    def index
        @authors = Author.order(name: :asc).load_async
        @categories = Category.order(name: :asc).load_async
        @articles = Article.all.order(updated_at: :desc).load_async
        
        if params[:category_id]
          @articles = @articles.where(category_id: params[:category_id])
        elsif params[:author_id]
          @articles = @articles.where(author_id: params[:author_id])
        end
        if params[:start_date].present? && params[:end_date].present?
            start_date = Date.parse(params[:start_date])
            end_date = Date.parse(params[:end_date]) + 1.day 
            @articles = @articles.where('updated_at >= ? AND updated_at <= ?', start_date, end_date)
        end
        if params[:query_text].present?
            @articles = @articles.search_full_text(params[:query_text])
        end
        @pagy, @articles = pagy_countless(@articles, items: 6)
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
            redirect_to '/articles', notice: 'Tu Artículo se ha publicado correctamente'
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
            redirect_to '/articles', notice: 'Tu Artículo se ha actualizado correctamente'

        else
            render :edit, status: :unprocessable_entity
        end


    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to '/articles', notice: 'Tu Artículo se ha eliminado correctamente', status: :see_other
    end

    private
    def article_params
        params.require(:article).permit(:title, :content, :author_id, :category_id, :image)
    end

end