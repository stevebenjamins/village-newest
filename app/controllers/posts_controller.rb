class PostsController < ApplicationController
  
  def index
    
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
  
  private

  def post_params
    params.require(:post).permit(:clicks)
  end  

end
