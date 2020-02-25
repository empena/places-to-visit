class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :location
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
