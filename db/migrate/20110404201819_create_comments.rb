class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.belongs_to :user, :null => false
      t.belongs_to :group, :null => false
      t.belongs_to :resource, :polymorphic => true
      t.string :body_mime
      t.text :body
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
