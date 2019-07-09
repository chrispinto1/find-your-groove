class CreateBands < ActiveRecord::Migration[5.2]
  def change
    create_table :bands do |t|
      t.string :name
      t.string :spotify_id
      t.belongs_to :genre, foreign_key: true

      t.timestamps
    end
  end
end
