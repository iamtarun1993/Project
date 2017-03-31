class CreateEmployeeatdncs < ActiveRecord::Migration[5.0]
  def change
    create_table :employeeatdncs do |t|
    	t.string :emp_id
    	t.date :date
    	t.string :value
      t.timestamps
    end
    execute "ALTER TABLE employeeatdncs ADD FOREIGN KEY(emp_id) REFERENCES employeedtls (emp_id);"
  end
end
