class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.boolean :hhmemberin
      t.integer :hhmembergen
      t.integer :hhmemberage
      t.integer :hhmemberrel
      t.string :hhmemberuasid
      t.integer :entry_id

      t.timestamps null: false
    end
  end
end
