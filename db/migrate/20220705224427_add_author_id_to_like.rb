class AddAuthorIdToLike < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :author_id_integer_index, :string
  end
end
