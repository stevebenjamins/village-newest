class PollItem < ActiveRecord::Base
  belongs_to :poll
  acts_as_votable
  acts_as_tree
  default_scope { order('cached_weighted_score DESC') }

  has_attached_file :image, 
    :styles => { :small => "150x100#", :thumb => "60x20#" },
    :storage => :s3,
    :bucket => 'itsonvillage',
    :s3_credentials => {
      :access_key_id => 'AKIAISD7GPKDPBKTPDWA',
      :secret_access_key => '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'
  }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
