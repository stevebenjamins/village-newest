class PostsController < ApplicationController
  
  def index
    @day_of_posts = Post.all.group_by{|x| x.created_at.strftime("%A, %b %d")} 
  end
  
  def out
    @post = Post.find(params[:id])
    @post.clicks =+ 1
    @post.save
    respond_to do |format|
        format.html { redirect_to @post.url }
    end
  end
  
  private

  def post_params
    params.require(:post).permit(:clicks)
  end  

end
