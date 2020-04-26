class RemoveUseridFromProjectsTable < ActiveRecord::Migration[6.0]
    def up
        remove_column :projects, :user_id
    end

    def down
        remove_column :projects, :user_id, :integer
    end
end