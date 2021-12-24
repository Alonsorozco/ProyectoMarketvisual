class AddPublisherToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :publisher, :boolean , default: false
  end
end
