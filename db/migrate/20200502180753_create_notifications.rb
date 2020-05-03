class CreateNotifications < ActiveRecord::Migration[6.0]
    def change
        create_table :notifications do |t|
            t.belongs_to :user
            t.string :data
            t.boolean :read, :default => false
            t.boolean :is_new_share, :default => false

            t.timestamps
        end
    end
end