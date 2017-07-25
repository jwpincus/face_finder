class CreateAuthentications < ActiveRecord::Migration[5.1]
  def change
    create_table :authentications do |t|
      t.references :user, foreign_key: true
      t.references :app, foreign_key: true
      t.text :image

      t.timestamps
    end
  end
end
