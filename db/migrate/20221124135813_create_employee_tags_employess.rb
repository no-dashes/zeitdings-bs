class CreateEmployeeTagsEmployess < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_tags_employees, id: false do |t|
      t.belongs_to :employee
      t.belongs_to :employee_tag
    end
  end
end
