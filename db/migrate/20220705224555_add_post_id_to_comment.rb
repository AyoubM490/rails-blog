class AddPostIdToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :post_id_integer_index, :string
  end
end
