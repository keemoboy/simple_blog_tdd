class CommentsController < ApplicationController
  # POST /comments
  # POST /comments.json
  before_filter :make_happy_comment, :only => :create

  def create
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.article, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { redirect_to @comment.article }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @comment.article }
      format.json { head :no_content }
    end
  end
  private
  def make_happy_comment
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(params[:comment])
    @comment.body.gsub!(/sad/,'happy')
    @comment
  end
end
