class CreateApps < ActiveRecord::Migration[5.1]
  def change
    create_table :apps do |t|
      t.string :name
      t.numeric :min_confidence, default: 0.6

      t.timestamps
    end
  end
end
