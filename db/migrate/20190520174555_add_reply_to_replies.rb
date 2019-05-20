class AddReplyToReplies < ActiveRecord::Migration[5.2]
  def change
    add_column :replies, :reply, :text
  end
end
