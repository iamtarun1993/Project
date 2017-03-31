class CreateAllSalaries < ActiveRecord::Migration[5.0]
  def change
    create_table :all_salaries do |t|
    	t.string :emp_id
    	t.integer :year
    	t.integer :month
    	t.integer :amount
      t.timestamps
    end
    execute "ALTER TABLE all_salaries ADD FOREIGN KEY(emp_id) REFERENCES employeedtls (emp_id);"
  end
end
