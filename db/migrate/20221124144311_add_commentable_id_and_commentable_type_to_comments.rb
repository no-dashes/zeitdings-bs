class AddCommentableIdAndCommentableTypeToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
  end
end
