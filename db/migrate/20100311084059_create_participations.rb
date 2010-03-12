class CreateParticipations < ActiveRecord::Migration
  def self.up
    create_table :participations do |t|
      t.integer :attender_id
      t.integer :meeting_id
      t.timestamps
    end
    add_foreign_key(:participations, :attenders)
    add_foreign_key(:participations, :meetings)
  end

  def self.down
    remove_foreign_key(:participations, :attenders)
    remove_foreign_key(:participations, :meetings)
    drop_table :participations
  end
end
