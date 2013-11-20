class AddManyToManyRelationshipTableContactPhone < ActiveRecord::Migration
  def change
    create_table :contacts_phones, id: false do |t|
      t.integer :contact_id
      t.integer :phone_id
    end
    add_index :contacts_phones, [:contact_id, :phone_id]
  end
end
