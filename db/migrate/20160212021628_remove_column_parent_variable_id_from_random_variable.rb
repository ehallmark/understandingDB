class RemoveColumnParentVariableIdFromRandomVariable < ActiveRecord::Migration
  def change
    remove_column(:random_variables, :parent_variable_id, :integer) 
    add_column(:random_variables, :associated_variable_id, :integer) 
  end
end
