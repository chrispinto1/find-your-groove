class AddSubgenreIdToBands < ActiveRecord::Migration[5.2]
  def change
    add_reference :bands, :subgenres, index: true
    add_foreign_key :bands, :subgenres
  end
end
