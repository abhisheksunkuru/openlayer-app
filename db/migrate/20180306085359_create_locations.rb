class CreateLocations < ActiveRecord::Migration
  def change
    enable_extension "postgis"
    create_table :locations do |t|
      t.point :lonlat,geographic: true
      t.references :user
      t.integer :to
      t.boolean :public

      t.timestamps
    end
  end
end
