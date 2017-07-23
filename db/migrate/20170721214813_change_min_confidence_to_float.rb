class ChangeMinConfidenceToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :apps, :min_confidence, :float, default: 0.6
  end
end
