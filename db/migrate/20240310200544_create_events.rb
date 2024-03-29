class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.string :description
      t.references :entry_date, null: false, foreign_key: true

      t.timestamps
    end
  end
end
