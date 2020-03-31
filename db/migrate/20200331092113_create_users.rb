class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.references :project, null: true, foreign_key: true
      t.references :task, null: true, foreign_key: true

      t.timestamps
    end
  end
end
