class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.boolean :is_admin
      t.string :profile_image
      t.string :gender
      t.date :date_of_birth


      t.string :password_digest

      t.timestamps
    end
  end
end
