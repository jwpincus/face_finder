class CreateEnrollments < ActiveRecord::Migration[5.1]
  def change
    create_table :enrollments do |t|
      t.references :user, foreign_key: true
      t.text :image
      t.string :response

      t.timestamps
    end
  end
end
