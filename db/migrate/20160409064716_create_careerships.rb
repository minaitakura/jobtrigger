class CreateCareerships < ActiveRecord::Migration
  def change
    create_table :careerships do |t|
      t.references :user, index: true, foreign_key: true
      t.references :job, index: true, foreign_key: true
      t.string :type

      t.timestamps null: false
      
      t.index [:user_id, :job_id , :type], unique: true
    end
  end
end
