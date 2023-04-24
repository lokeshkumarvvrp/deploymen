class AddReceivedMessagesCountToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :received_messages_count, :integer,default: 0

    User.find_each do |user|
      User.reset_counters(user.id, :received_messages)
    end
  end
end
