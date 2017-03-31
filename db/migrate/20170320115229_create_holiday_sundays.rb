class CreateHolidaySundays < ActiveRecord::Migration[5.0]
  def change
    create_table :holiday_sundays, id: false do |t|
    		t.date :date
    	t.string :reason
      t.timestamps
    end
    execute "ALTER TABLE holiday_sundays ADD PRIMARY KEY (date);"
  end
end
