class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :title
      t.string :location
      t.integer :area
      t.string :description
      t.decimal :daily_rate
      t.integer :rooms
      t.integer :minimum_rent_days
      t.integer :maximun_rent_days
      t.string :photo
      t.integer :maximum_occupancy
      t.string :usage_rules

      t.timestamps
    end
  end
end
