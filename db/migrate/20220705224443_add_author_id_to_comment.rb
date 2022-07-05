# frozen_string_literal: true

class AddAuthorIdToComment < ActiveRecord::Migration[7.0] # rubocop:todo Style/Documentation
  def change
    add_column :comments, :author_id_integer_index, :string
  end
end
