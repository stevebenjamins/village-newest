class PollsController < ApplicationController
  before_filter :set_active_link
    
  def index
    @polls = Poll.all
  end
  
  def show
    @poll = Poll.find(params[:id])
    @facebook_image = @poll.facebook_image.url(:large)
    @facebook_title = "Poll: " + @poll.name
    @facebook_description = "What's your favorite? Vote the best. "
    @title = "Poll: " + @poll.name
  end

  def new
    @poll = Poll.new
  end
  
  def create
    @poll = Poll.new(poll_params)

    respond_to do |format|
      if @poll.save
        format.html { redirect_to polls_url, notice: 'Created new poll.' }
      else
        format.html { render action: "new" }
      end
    end    
  end

  def edit
    @poll = Poll.find(params[:id])
    @polls = Poll.all
  end
  
  def update
    @poll = Poll.find(params[:id])

    respond_to do |format|
      if @poll.update_attributes(poll_params)
        format.html { redirect_to poll_url(@poll), notice: 'Updated poll.' }
      else
        format.html { render action: "edit" }
      end
    end
  end
 

  def destroy
    @poll = Poll.find(params[:id])
    @poll.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Deleted poll.' }
    end
  end

  def set_active_link
    @sidebar_active = "polls"
  end
    
  private

  def poll_params
    params.require(:poll).permit(:name, :permalink, :facebook_image, :voting_closes, poll_items_attributes: [:id, :url, :name, :description, :poll_id, :_destroy, :image])
  end  

end
