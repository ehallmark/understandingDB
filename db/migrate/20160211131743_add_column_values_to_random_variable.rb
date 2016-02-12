class AddColumnValuesToRandomVariable < ActiveRecord::Migration
  def change
    add_column :random_variables, :values, :float, :array=>true, :default=>[]
    add_column :random_variables, :n_count, :integer
  end
end
