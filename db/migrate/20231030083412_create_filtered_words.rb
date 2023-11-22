class CreateFilteredWords < ActiveRecord::Migration[7.0]
  def change
    create_table :filtered_words do |t|
      t.string :word

      t.timestamps
    end
  end
end
