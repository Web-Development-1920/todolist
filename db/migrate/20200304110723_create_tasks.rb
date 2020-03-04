class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.datetime :deadline
      t.integer :priority
      t.boolean :done, :default => false

      t.timestamps
    end
  end
end
