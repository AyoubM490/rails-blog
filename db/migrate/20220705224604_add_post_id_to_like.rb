# frozen_string_literal: true

class AddPostIdToLike < ActiveRecord::Migration[7.0] # rubocop:todo Style/Documentation
  def change
    add_column :likes, :post_id_integer_index, :string
  end
end
