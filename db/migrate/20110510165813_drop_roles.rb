class DropRoles < ActiveRecord::Migration
  def self.up
    drop_table :users_games_roles
    drop_table :roles
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
