class RepliesController < ApplicationController
  def new
    @reply = Reply.new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @reply = Reply.new(reply_params)
    @reply.post_id = @post.id
    @reply.user_id = current_user.id
    if @reply.save
      flash[:notice] = "New reply created"
      redirect_to post_path(@reply.post_id)
    else
      render :new
    end
  end

  def show
    @reply = Reply.find(params[:id])
    @post = Post.find(params[:post_id])
  end

  private

  def reply_params
    params.require(:reply).permit(:content)
  end
end
