class Fixhosts < ActiveRecord::Migration
  def self.up
      add_column :hosts, :first_name, :string
      add_column :hosts, :last_name, :string
  end

  def self.down
    remove_column :hosts, :first_name, :string
    remove_column :hosts, :last_name, :string
  end
end

