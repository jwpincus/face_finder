class CreateAppUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :app_users do |t|
      t.references :user, foreign_key: true
      t.references :app, foreign_key: true

      t.timestamps
    end
  end
end
