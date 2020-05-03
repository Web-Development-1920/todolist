class AddAcceptedToShares < ActiveRecord::Migration[6.0]
    def change
        add_column :shares, :accepted, :boolean, default: true
    end
end