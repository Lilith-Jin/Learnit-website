class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :price
      t.text :intro
      t.decimal :hour
      t.string :cover

      t.timestamps
    end
  end
end
