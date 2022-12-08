# frozen_string_literal: true

# Users migration
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: { unique: true }
      t.string :login
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :login, unique: true
  end
end