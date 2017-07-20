class ChangeEnrollmentResponseToJson < ActiveRecord::Migration[5.1]
  def change
    remove_column :enrollments, :response
    add_column :enrollments, :response, :json , default: {}, null: false
  end
end
