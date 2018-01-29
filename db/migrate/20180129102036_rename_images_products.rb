class RenameImagesProducts < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :images, :image
  end
end
