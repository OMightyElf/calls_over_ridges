class ChangeAttachmentsToPhotoAttachments < ActiveRecord::Migration
  def change
  rename_table :attachments, :photo_attachments
  end
end
