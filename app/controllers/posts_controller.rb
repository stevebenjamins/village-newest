class PostsController < ApplicationController

  def feed
    # @posts = Post.all
    from   = (Time.zone.now).beginning_of_day.in_time_zone('Eastern Time (US & Canada)')
    @featured_post = Post.where(["created_at >= ? and featured = ?", from, true]).first
    @posts = Post.find(:all, :conditions => ["id != ?", @featured_post.id])
    render :template => 'posts/feed.rss.builder', :layout => false
  end
  
  def submit
  
  end  
    
  def index

    @facebook_image = ActionController::Base.helpers.asset_path('facebook-image.jpg')
    @facebook_description = "The best of Toronto news. Hand-picked daily."
        
    # Day 1
    from   = (Time.zone.now).beginning_of_day.in_time_zone('Eastern Time (US & Canada)')
    @day_1 = Post.where(["created_at >= ?", from])
        
    # Day 2
    from = (Time.zone.now - 1.day).beginning_of_day.in_time_zone('Eastern Time (US & Canada)')
    to   = (Time.zone.now).beginning_of_day.in_time_zone('Eastern Time (US & Canada)')
    @day_2 = Post.where(["created_at >= ? and created_at <= ?", from, to])
    
    # Day 3
    from = (Time.zone.now - 2.day).beginning_of_day.in_time_zone('Eastern Time (US & Canada)')
    to   = (Time.zone.now - 1.day).beginning_of_day.in_time_zone('Eastern Time (US & Canada)')
    @day_3 = Post.where(["created_at >= ? and created_at <= ?", from, to])
    
    # Day 4
    from = (Time.zone.now - 3.day).beginning_of_day.in_time_zone('Eastern Time (US & Canada)')
    to   = (Time.zone.now - 2.day).beginning_of_day.in_time_zone('Eastern Time (US & Canada)')
    @day_4 = Post.where(["created_at >= ? and created_at <= ?", from, to])
    
    # Day 5
    from = (Time.zone.now - 4.day).beginning_of_day.in_time_zone('Eastern Time (US & Canada)')
    to   = (Time.zone.now - 3.day).beginning_of_day.in_time_zone('Eastern Time (US & Canada)')
    @day_5 = Post.where(["created_at >= ? and created_at <= ?", from, to])
    
    # Day 6
    from = (Time.zone.now - 5.day).beginning_of_day.in_time_zone('Eastern Time (US & Canada)')
    to   = (Time.zone.now - 4.day).beginning_of_day.in_time_zone('Eastern Time (US & Canada)')
    @day_6 = Post.where(["created_at >= ? and created_at <= ?", from, to])
    
    # Day 7
    from = (Time.zone.now - 6.day).beginning_of_day.in_time_zone('Eastern Time (US & Canada)')
    to   = (Time.zone.now - 5.day).beginning_of_day.in_time_zone('Eastern Time (US & Canada)')
    @day_7 = Post.where(["created_at >= ? and created_at <= ?", from, to])

  end
  
  def out
    @post = Post.find(params[:id])
    @post.clicks = @post.clicks + 1
    @post.save
    respond_to do |format|
        format.html { redirect_to @post.url }
    end
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to new_post_url, notice: 'Created new post.' }
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
    params.require(:post).permit(:headline, :byline, :url, :image, :featured, :clicks, :user_id)
  end  

end
