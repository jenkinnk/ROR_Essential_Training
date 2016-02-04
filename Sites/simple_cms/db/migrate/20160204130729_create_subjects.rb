class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.int :position
      t.boolean :visible

      t.timestamps null: false
    end
  end
end
