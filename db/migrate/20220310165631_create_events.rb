class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.string :description
      t.date :date
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
