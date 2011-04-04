class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, :limit => 100
      t.string :email, :limit => 300
      t.boolean :admin, :default => false
      t.datetime :last_login_at
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
