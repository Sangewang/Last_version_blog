class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        @comment = Comment.create(comment_params)
        redirect_to article_path(@article)
    end
    
    def show
        @article = Article.find(params[:article_id])
    end
    
    private
    def comment_params
        params.require(:comment).permit(:commenter, :body)
    end
end
