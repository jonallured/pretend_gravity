class CreateArtworks < ActiveRecord::Migration[7.1]
  def change
    create_table :artworks do |t|
      t.string :artist_name
      t.string :title
      t.string :medium
      t.integer :amount_cents
      t.timestamps
    end
  end
end
