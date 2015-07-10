class CommentsController < ApplicationController
  
  def feed
    @comments = Comment.find(:all)
    render :template => 'comments/feed.rss.builder', :layout => false
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    respond_to do |format|
      format.js
    end    
  end
  
  def highlight
    @comment = Comment.find(params[:id])
    @comment.highlight = true
    @comment.save 
    
    respond_to do |format|
      format.js
    end    
  end
  
  def link_comments

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

    @post = Post.find(params[:id])
    @comment = Comment.new
    respond_to do |format|
      format.html
    end    
    
  end
    
  def create
    @comment = Comment.new(post_params)
    @comment.user_id = current_user.id
    authorize! :create, @comment
    @comment.save
    
    @comment.liked_by current_user
    @comment.votes_for.size 

    respond_to do |format|
      format.js
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

  def vote
    @comment = Comment.find(params[:id])
    @comment.liked_by current_user
    respond_to do |format|
      format.js { render :action => "vote" }
    end
  end    

  def removevote
    @comment = Comment.find(params[:id])
    @comment.unliked_by current_user
    respond_to do |format|
      format.js { render :action => "vote" }
    end
  end
  
  private

  def post_params
    params.require(:comment).permit(:comment, :post_id)
  end  

end
