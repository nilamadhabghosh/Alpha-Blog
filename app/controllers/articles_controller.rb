class ArticlesController < ApplicationController
    def new
        @article = Article.new
    end

    def create
      @article = Article.new(article_params)
      if @article.save
        #Do Something
        flash[:notice] = "Article was succeefully created"
        redirect_to article_path(@article)
      else
        render 'new'
      end
      #render plain: params[:article].inspect
      #redirect_to article_path(@article)
    end

    def show
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title,:description)
    end
end