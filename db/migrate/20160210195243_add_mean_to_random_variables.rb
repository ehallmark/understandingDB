class AddMeanToRandomVariables < ActiveRecord::Migration
  def change
    add_column :random_variables, :param1, :float
    add_column :random_variables, :param2, :float
    add_column :random_variables, :param3, :float
    add_column :random_variables, :param4, :float
    add_column :random_variables, :param5, :float
    add_column :random_variables, :param6, :float
    add_column :random_variables, :distribution, :string
    add_column :random_variables, :name, :string
    add_column :random_variables, :parent_variable_id, :integer
  end
end
