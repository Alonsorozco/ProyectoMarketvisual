class AddPublicationToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :publication, foreign_key: true
  end
end
