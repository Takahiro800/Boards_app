class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string :title, null: false
      t.text :description

      t.timestamps
    end
  end
end
