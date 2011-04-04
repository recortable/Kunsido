class CreateReunions < ActiveRecord::Migration
  def self.up
    create_table :reunions do |t|
      t.belongs_to :user, :null => false
      t.belongs_to :group
      t.string :name, :null => false
      t.string :body_mime
      t.text :body
      t.datetime :starting_at
      t.datetime :ending_at
      t.timestamps
    end
  end

  def self.down
    drop_table :reunions
  end
end
