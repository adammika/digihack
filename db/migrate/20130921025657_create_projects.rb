class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.references :creator

      t.timestamps
    end
    add_index :projects, :creator_id
  end
end
