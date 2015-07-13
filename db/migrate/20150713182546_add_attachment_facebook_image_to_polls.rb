class AddAttachmentFacebookImageToPolls < ActiveRecord::Migration
  def self.up
    change_table :polls do |t|
      t.attachment :facebook_image
    end
  end

  def self.down
    remove_attachment :polls, :facebook_image
  end
end
