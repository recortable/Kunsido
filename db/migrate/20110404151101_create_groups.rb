class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.belongs_to :user, :null => false
      t.string :name, :null => false
      t.string :body_mime
      t.text :body
      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
