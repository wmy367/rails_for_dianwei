class CommentsController < ApplicationController
  def create
      @comment = Comment.new(comment_params)
    #   @comment.content = comment_params[:content]
    #   @comment.user_id = comment_params[:user]
      if @comment.save
          flash[:notice] = "评论成功"
      else
          flash[:notice] = "评论失败"
      end
      redirect_to  Item.find(@comment.item_id)
  end

  def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to root_path
  end

  private
    def comment_params
        params.require(:comment).permit(:content,:user_id,:item_id)
    end
end
