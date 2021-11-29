class RenamePulicationIdFromPublicationCategories < ActiveRecord::Migration[5.2]
  def change
    rename_column :publication_categories, :pulication_id, :publication_id
  end
end
