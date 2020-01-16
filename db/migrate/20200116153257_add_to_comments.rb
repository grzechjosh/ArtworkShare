class AddToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :user, foreign_key: true, null: false
    add_reference :comments, :artwork, foreign_key: true, null: false
  end
end
