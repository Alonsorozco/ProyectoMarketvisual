class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.date :date
      t.integer :phone
      t.string :message

      t.timestamps
    end
  end
end
