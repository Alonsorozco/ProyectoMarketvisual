class AddQuoteToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :quote, :boolean, default: false
  end
end
