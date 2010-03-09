class CreateAttenders < ActiveRecord::Migration
  def self.up
    create_table :attenders do |t|
      t.string :name
      t.string :email
      t.boolean :organizator
      t.integer :meeting_id
      t.timestamps
    end
    add_foreign_key(:attenders, :meetings)
  end

  def self.down
    Attenders.delete_all
    remove_foreign_key(:attenders, :meetings)
    drop_table :attenders
  end
end
