class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, :null => false
      t.string :email
      t.boolean :admin, :default => false
      t.boolean :invited, :default => false
      t.datetime :last_login_at
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
