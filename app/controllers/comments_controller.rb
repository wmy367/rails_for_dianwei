class CommentsController < ApplicationController
  def create
      @comment = Comment.new(comment_params)
    #   @comment.content = comment_params[:content]
    #   @comment.user_id = comment_params[:user]
      item = Item.find(@comment.item_id)
      if @comment.save
          flash[:notice] = "评论成功"
        #   item.update(status: params[:comment][:status])
          item.update(status: comment_status_param)
      else
          flash[:notice] = "评论失败"
      end
      redirect_to item
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

    def comment_status_param
        params.require(:comment).permit(:status)
    end
end
