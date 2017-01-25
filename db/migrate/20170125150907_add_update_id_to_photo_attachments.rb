class AddUpdateIdToPhotoAttachments < ActiveRecord::Migration
  def change
    add_column :photo_attachments, :update_id, :integer
  end
end
