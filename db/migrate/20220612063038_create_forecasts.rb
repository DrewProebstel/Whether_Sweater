class CreateForecasts < ActiveRecord::Migration[5.2]
  def change
    create_table :forecasts do |t|
      t.string :datetime
      t.string :sunrise
      t.string :sunset

      t.timestamps
    end
  end
end
