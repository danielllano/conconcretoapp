class AddAttachmentImagesToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :image1
      t.attachment :image2
      t.attachment :image3
    end
  end

  def self.down
    remove_attachment :products, :image1
    remove_attachment :products, :image2
    remove_attachment :products, :image3
  end
end
