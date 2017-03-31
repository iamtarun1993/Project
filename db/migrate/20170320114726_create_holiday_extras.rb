class CreateHolidayExtras < ActiveRecord::Migration[5.0]
  def change
    create_table :holiday_extras, id: false do |t|
    	t.date :date
    	t.string :reason
      t.timestamps
    end
     execute "ALTER TABLE holiday_extras ADD PRIMARY KEY (date);"
  end
end
