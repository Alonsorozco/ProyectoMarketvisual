class AddPublicationRefToComents < ActiveRecord::Migration[5.2]
  def change
    add_reference :coments, :publication, foreign_key: true
  end
end
