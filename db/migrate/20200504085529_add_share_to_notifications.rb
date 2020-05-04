class AddShareToNotifications < ActiveRecord::Migration[6.0]
    def change
        remove_column :notifications, :is_new_share, :boolean
        add_column :notifications, :share_id, :integer
    end
end