class CommentsController < ApplicationController
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    respond_to do |format|
      format.js
    end    
  end
  
  def create
    @comment = Comment.new(post_params)
    @comment.user_id = current_user.id
    authorize! :create, @comment

    respond_to do |format|
      if @comment.save
        format.js
      end
    end    
  end

 
  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment
    @comment_id = @comment.id
    
    respond_to do |format|
      if @comment.destroy
        format.js
      end
    end
  end
  
  private

  def post_params
    params.require(:comment).permit(:comment, :post_id)
  end  

end
