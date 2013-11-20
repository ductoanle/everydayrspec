class CreateTablePhone < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :phone_type
      t.string :phone
      t.timestamps
    end
  end
end
