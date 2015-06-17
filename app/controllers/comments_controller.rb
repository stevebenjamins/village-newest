class CommentsController < ApplicationController
  
  def index
    @comments = Comment.all
    respond_to do |format|
      format.js
    end    
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_url, notice: 'Created new post.' }
      else
        format.html { render action: "new" }
      end
    end    
  end

  def edit
    @post = Post.find(params[:id])
    @posts = Post.all
  end
  
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(post_params)
        format.html { redirect_to root_url, notice: 'Updated post.' }
      else
        format.html { render action: "edit" }
      end
    end
  end
 
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Deleted post.' }
    end
  end
  
  private

  def post_params
    params.require(:comment).permit(:comment)
  end  

end
