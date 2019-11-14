class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.string :content
      t.references :category, foreign_key: true, null: true
      t.references :post, foreign_key: true, null: true

      t.timestamps
    end
  end
end
