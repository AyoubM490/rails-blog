# frozen_string_literal: true

class AddPostIdToComment < ActiveRecord::Migration[7.0] # rubocop:todo Style/Documentation
  def change
    add_column :comments, :post_id_integer_index, :string
  end
end
