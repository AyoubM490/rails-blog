# frozen_string_literal: true

class AddAuthorIdToPost < ActiveRecord::Migration[7.0] # rubocop:todo Style/Documentation
  def change
    add_column :posts, :author_id_integer_index, :string
  end
end
