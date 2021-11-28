class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      t.integer :score
      t.string :title
      t.string :description
      t.integer :value

      t.timestamps
    end
  end
end
