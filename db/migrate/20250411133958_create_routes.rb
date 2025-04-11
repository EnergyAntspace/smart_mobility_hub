class CreateRoutes < ActiveRecord::Migration[8.0]
  def change
    create_table :routes do |t|
      t.string :origin
      t.string :destination
      t.float :distance
      t.float :duration
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
