class Attendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.references :admin, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end