class AddOfficeIdToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_reference :employees, :office
  end
end
