class RemoveAuthorFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :author, :string
  end
end
