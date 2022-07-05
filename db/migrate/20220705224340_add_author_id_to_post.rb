class AddAuthorIdToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :author_id_integer_index, :string
  end
end
