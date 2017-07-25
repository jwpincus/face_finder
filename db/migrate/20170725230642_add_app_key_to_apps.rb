class AddAppKeyToApps < ActiveRecord::Migration[5.1]
  def change
    add_column :apps, :app_key, :string
  end
end
