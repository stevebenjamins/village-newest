class PollItemsController < ApplicationController
  
  def vote
    @poll_item = PollItem.find(params[:id])
    @poll_item.liked_by current_user
    respond_to do |format|
      format.js { render :action => "vote" }
    end
  end    

  def removevote
    @poll_item = PollItem.find(params[:id])
    @poll_item.unliked_by current_user
    respond_to do |format|
      format.js { render :action => "vote" }
    end
  end
  
  private

  def poll_item_params
    params.require(:poll_item).permit()
  end  

end