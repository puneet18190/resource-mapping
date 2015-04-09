class Renametypefromresource < ActiveRecord::Migration
  def change
  	rename_column :resources, :type, :r_type
  end
end
