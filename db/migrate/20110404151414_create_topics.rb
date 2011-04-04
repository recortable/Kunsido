class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.belongs_to :user, :null => false
      t.belongs_to :reunion
      t.belongs_to :group, :null => false
      t.string :name, :null => false
      t.string :body_mime
      t.text :body
      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end
end
