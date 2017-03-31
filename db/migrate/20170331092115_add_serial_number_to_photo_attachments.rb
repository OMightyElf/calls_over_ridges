class AddSerialNumberToPhotoAttachments < ActiveRecord::Migration
  def change
    add_column :photo_attachments, :serial_number, :integer
  end
end
