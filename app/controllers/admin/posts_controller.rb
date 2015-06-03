class Admin::PostsController < Admin::AdminController
  
  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to admin_posts_url, notice: 'Created new post.' }
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
        format.html { redirect_to admin_posts_url(), notice: 'Updated post post.' }
      else
        format.html { render action: "edit" }
      end
    end
  end
 

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to admin_posts_url, notice: 'Deleted post post.' }
    end
  end
  
  private

  def post_params
    params.require(:post).permit(:headline, :byline, :url, :image, :featured)
  end  
  
end
