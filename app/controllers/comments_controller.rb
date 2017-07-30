class CommentsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

  def new
    @weetup = Weetup.find(params[:weetup_id])
    @comment = Comment.new
  end

  def create
    @weetup = Weetup.find(params[:weetup_id])
    @comment = Comment.new(comment_params)
    @comment.weetup = @weetup
    @comment.user = current_user

    if @comment.save
      redirect_to weetup_path(@weetup)
    else
      render :new
    end
  end

  def edit
    @weetup = Weetup.find(params[:weetup_id])
    @comment = Comment.find(params[:id])
    @comment.weetup = @weetup
  end

  def update
    @weetup = Weetup.find(params[:weetup_id])
    @comment = Comment.find(params[:id])
    @comment.weetup = @weetup
    @comment.user = current_user
    if @comment.update(comment_params)
      redirect_to weetup_path(@weetup), notice: "编辑成功"
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to weetups_path, alert: "删除留言成功"
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
