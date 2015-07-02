class Comment < ActiveRecord::Base
  after_create :google_event
  
  belongs_to :post
  belongs_to :user
  
  default_scope order('created_at DESC')

end
