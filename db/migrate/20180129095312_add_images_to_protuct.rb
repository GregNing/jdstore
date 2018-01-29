class AddImagesToProtuct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :images, :string
  end
end
