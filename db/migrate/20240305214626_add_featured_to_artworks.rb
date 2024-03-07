class AddFeaturedToArtworks < ActiveRecord::Migration[7.1]
  def change
    add_column :artworks, :featured, :boolean, default: false, null: false
  end
end
