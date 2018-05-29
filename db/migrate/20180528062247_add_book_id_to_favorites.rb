class AddBookIdToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_column :favorites, :book_id, :integer
  end
end
