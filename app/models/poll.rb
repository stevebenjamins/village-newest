class Poll < ActiveRecord::Base
  has_many :poll_items
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :poll_items, :reject_if => :all_blank, :allow_destroy => true

  has_attached_file :facebook_image, 
    :styles => { :large => "1200x628#" },
    :storage => :s3,
    :bucket => 'itsonvillage',
    :s3_credentials => {
      :access_key_id => 'AKIAISD7GPKDPBKTPDWA',
      :secret_access_key => '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'
  }
  validates_attachment_content_type :facebook_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  

end
