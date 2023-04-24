class AddSentMessagesCountToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :sent_messages_count, :integer,default: 0

    User.find_each do |user|
      User.reset_counters(user.id, :sent_messages)
    end
  end
end
