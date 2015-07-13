class Comment < ActiveRecord::Base
  acts_as_votable
  acts_as_tree
  default_scope { order('cached_weighted_score DESC') }
  belongs_to :commentable, polymorphic: true

  belongs_to :post
  belongs_to :user
  
end
