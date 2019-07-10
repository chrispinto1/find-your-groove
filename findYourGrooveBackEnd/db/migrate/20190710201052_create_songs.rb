class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :title
      t.belongs_to :band, foreign_key: true
      t.string :spoitfy_snippet
    end
  end
end
