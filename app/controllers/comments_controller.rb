class CommentsController < ApplicationController

  http_basic_authenticate_with name: "cobalt", password: "cobalt", only: :destroy

  def show
    @article = Article.find(params[:article_id])
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    if @comment.save
      redirect_to article_path(@article)
    else
      redirect_to article_path(@article)
      if @comment.commenter.length < 1
        flash[:commentNameError] = "Your Name has to be at least 1 character long."
      end
      if @comment.body.length < 1
        flash[:commentBodyError] = "Your Comment has to be at least 1 character long."
      end
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end

end
