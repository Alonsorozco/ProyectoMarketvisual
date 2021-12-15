class CreatePublicationCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :publication_categories do |t|
      t.references :category, foreign_key: true
      t.references :publication, foreign_key: true

      t.timestamps
    end
  end
end
