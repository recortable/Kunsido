class CreateAuthorizations < ActiveRecord::Migration
  def self.up
    create_table :authorizations do |t|
      t.string :provider, :limit => 100
      t.string :uid, :limit => 500
      t.belongs_to :user
      t.timestamps
    end
  end

  def self.down
    drop_table :authorizations
  end
end
