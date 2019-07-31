class AddTitleAndPhotoToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :title, :string
    add_column :posts, :photo, :string
  end
end
