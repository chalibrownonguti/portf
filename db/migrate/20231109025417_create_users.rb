class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :is_admin, deafault: false
      t.string :profile_image
      t.string :gender
      t.date :date_of_birth
      t.string :email
      t.string :hashed_email

      t.string :password_digest

      t.timestamps
    end
  end
end
