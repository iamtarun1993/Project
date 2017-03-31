class CreateEmployeedtls < ActiveRecord::Migration[5.0]
  def change
    create_table :employeedtls, id: false do |t|
    	t.string :emp_id
    	t.string :name
    	t.string :designation
    	t.date 	 :joindate
    	t.integer :contactno, :limit => 8
    	t.string :emailid
    	t.string :address
    	t.integer :salary
    	t.date   :dob
    	t.string :city
    	t.string :state
    	t.integer :pincode
    	t.string :image
      t.timestamps
    end
    execute "ALTER TABLE employeedtls ADD PRIMARY KEY (emp_id);"
  end
end
