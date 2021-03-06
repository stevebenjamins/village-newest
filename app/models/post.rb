class Post < ActiveRecord::Base
  default_scope { order('created_at DESC') }
  before_create :set_clicks    
    
  has_many :comments, as: :commentable

  has_attached_file :image, 
    :styles => { :large => "1100x500#", :thumb => "100x100#" },
    :storage => :s3,
    :bucket => 'itsonvillage',
    :s3_credentials => {
      :access_key_id => 'AKIAISD7GPKDPBKTPDWA',
      :secret_access_key => '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'
  }

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
  
  private

  def set_clicks
    self.clicks = 0
  end

end