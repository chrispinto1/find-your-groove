class CreateBandSubgenres < ActiveRecord::Migration[5.2]
  def change
    create_table :band_subgenres do |t|
      t.integer :band_id
      t.integer :subgenre_id
    end
  end
end
