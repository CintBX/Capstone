class RemoveCommentFromReplies < ActiveRecord::Migration[5.2]
  def change
    remove_column :replies, :comment, :text
  end
end
