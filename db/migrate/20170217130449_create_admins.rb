class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
    	t.string :username
    	t.string :password
    	t.string :name
      t.timestamps
    end
  end
end
