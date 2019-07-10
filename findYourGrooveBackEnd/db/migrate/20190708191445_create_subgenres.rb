class CreateSubgenres < ActiveRecord::Migration[5.2]
  def change
    create_table :subgenres do |t|
      t.string :category
      t.integer :genre_id
    end
  end
end
