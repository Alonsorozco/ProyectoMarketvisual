class AddPublicationRefToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :quotes, :publication, foreign_key: true
  end
end
