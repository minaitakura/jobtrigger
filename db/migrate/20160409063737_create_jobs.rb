class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.text :name
      t.text :company
      t.text :product
      t.text :role
      t.text :description

      t.timestamps null: false
    end
  end
end
