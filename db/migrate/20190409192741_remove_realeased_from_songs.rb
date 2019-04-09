class RemoveRealeasedFromSongs < ActiveRecord::Migration[5.0]
  def change
    remove_column :songs, :realeased, :boolean
  end
end
