class RemovePhotosFromPosts < ActiveRecord::Migration[6.0]
  def change
	  remove_column :posts, :photo, :string
  end
end
