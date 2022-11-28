class CreateEmployeeTags < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_tags do |t|
      t.string :title

      t.timestamps
    end
  end
end
