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

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
  
end
