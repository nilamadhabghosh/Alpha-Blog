class ArticlesController < ApplicationController
    
  before_action :set_article, only: [:edit,:update,:show,:destroy]
    def index
      @articles = Article.all
    end
    def new
        @article = Article.new
    end

    def edit
     
    end

    def create
      #debugger
      @article = Article.new(article_params)
      @article.user = User.first
      if @article.save
        #Do Something
        flash[:success] = "Article was succeefully created"
        redirect_to article_path(@article)
      else
        render 'new'
      end
      #render plain: params[:article].inspect
      #redirect_to article_path(@article)
    end

    def update
      if @article.update(article_params)
        flash[:success] = "Article has been successfully updated"
        redirect_to article_path(@article)
      else
        render 'new'
      end 
    end

    def show
    end

    def destroy
      @article = Article.find(params[:id])
      @article.destroy
      flash[:danger] = "Article was Successfully Deleted"
      redirect_to root_path
    end
   private
     def set_article
       @article = Article.find(params[:id])
     end

    def article_params
      params.require(:article).permit(:title,:description)
    end
end