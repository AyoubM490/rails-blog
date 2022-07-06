# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[7.0] # rubocop:todo Style/Documentation
  def change
    create_table :likes do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :post, foreign_key: true
      t.timestamps
    end
  end
end
