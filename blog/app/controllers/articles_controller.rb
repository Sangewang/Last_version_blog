class ArticlesController < ApplicationController
    def new
        @user = User.find(params[:user_id])
        @article = Article.new(params[:article_id])
    end
    
    def show
        @article = Article.find(params[:article_id])
    end
    
    def create
        @user = User.find(params[:user_id])
        @article = @user.articles.create(article_params)
        
        
        if @article.save
            @article.update(init_time: Time.now.clone, edit_time: Time.now.clone)
            redirect_to articles_path
        else
            render 'new'
        end
    end
    
    def index
        @user = User.find(params[:user_id])
        @articles = @user.articles
    end
    
    def edit
        @user = User.find(params[:user_id])
        @article = @user.articles.find(params[:article_id])
    end
    
    def destroy
        @user = User.find(params[:user_id])
        @article = @user.articles.find(params[:article_id])
        @article.destroy
        redirect_to articles_path
    end
    
    def init_time_sort
        @articles = Article.order('created_at DESC')
    end
    
    def dairy
        @user = User.find(params[:user_id])
        @result = []
        @user.articles.each do |article|
            if article.category == 'dairy'
                @result << article
            end
        end
        @result
    end
    
    def inquire
        @user = User.find(params[:user_id])
        @articles = @user.articles
        @result = []
        
        @articles.each do |article|
            if article.title.include?(inquire_content) or article.text.include?(inquire_content)
                @result << article
            end
        end
    end
    
    private
    def article_params
        params.require(:article).permit(:title, :text, :init_time, :edit_time, :category, :id)
    end
end

