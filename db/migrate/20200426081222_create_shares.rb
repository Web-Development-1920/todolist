class CreateShares < ActiveRecord::Migration[6.0]
    def change
        create_table :shares do |t|
            t.belongs_to :user
            t.belongs_to :project

            t.timestamps
        end
    end
end