class AddCourseIdColumn < ActiveRecord::Migration[6.1]
  def change
              #要寫進的table,參照的table
    add_reference :reviews, :course, index: true
  end
end
