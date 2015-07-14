class CommentsController < ApplicationController
  
  def index 
    @commentable = find_commentable
    @comments = @commentable.comments
    @comment = Comment.new
    respond_to do |format|
      format.js
    end    
  end
  
  def feed
    @comments = Comment.find_all_by_commentable_type("Post")
    render :template => 'comments/feed.rss.builder', :layout => false
  end
  
  def link_comments
    @commentable = find_commentable
    @comments = @commentable.comments

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

    # @post = Post.find(params[:id])
    # @comments = @post.comments
    @comment = Comment.new
    respond_to do |format|
      format.html
    end    
    
  end
    
  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(post_params)
    @comment.user_id = current_user.id
    authorize! :create, @comment
    @comment.save
    
    @comment.liked_by current_user
    @comment.votes_for.size 

    respond_to do |format|
      format.js
    end    
  end

   def parent_reply
     @commentable = find_commentable
     @comment = Comment.new
     @parent_comment = Comment.find_by_id(params[:id])

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
  
  def edit
    @commentable = find_commentable
    @comment = Comment.find(params[:id])
    @post = @comment.post
    
    respond_to do |format|
      format.js
    end
  end
  
  def update
    @commentable = find_commentable
    @comment = Comment.find(params[:id])
    authorize! :update, @comment
  
    respond_to do |format|
      if @comment.update_attributes(post_params)
        format.js
      end
    end
  end
  
  def vote
    @commentable = find_commentable
    @comments = @commentable.comments
    @comment = Comment.find(params[:id])
    @comment.liked_by current_user
    respond_to do |format|
      format.js { render :action => "vote" }
    end
  end    

  def removevote
    @commentable = find_commentable
    @comments = @commentable.comments
    @comment = Comment.find(params[:id])
    @comment.unliked_by current_user
    respond_to do |format|
      format.js { render :action => "vote" }
    end
  end
  
  private

  def post_params
    params.require(:comment).permit(:comment, :commentable_id, :commentable_type, :user_id, :updated_at, :parent_id)
  end  

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

end
