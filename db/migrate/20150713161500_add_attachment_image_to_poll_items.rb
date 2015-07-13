class AddAttachmentImageToPollItems < ActiveRecord::Migration
  def self.up
    change_table :poll_items do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :poll_items, :image
  end
end
