class CreateSubgenres < ActiveRecord::Migration[5.2]
  def change
    create_table :subgenres do |t|
      t.string :category
      t.belongs_to :genre, foreign_key: true

      t.timestamps
    end
  end
end
