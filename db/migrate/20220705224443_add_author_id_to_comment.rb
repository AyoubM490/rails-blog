class AddAuthorIdToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :author_id_integer_index, :string
  end
end
