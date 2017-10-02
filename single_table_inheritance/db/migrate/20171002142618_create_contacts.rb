class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :type
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :mobile
      t.string :address
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
    add_index :contacts, [:type, :id]
  end
end
