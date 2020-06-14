class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :board, null: false, foreign_key: true
      t.text :content, null: false
      t.string :name, null: false, default: '名無しさん'

      t.timestamps
    end
  end
end
