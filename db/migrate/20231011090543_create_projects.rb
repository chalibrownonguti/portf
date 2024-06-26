class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.boolean :is_public
      t.boolean :is_featured
      t.boolean :is_approved, default: false
      
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
