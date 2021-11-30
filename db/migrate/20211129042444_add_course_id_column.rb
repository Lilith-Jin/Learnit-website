class AddCourseIdColumn < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :course, index: true
  end
end
