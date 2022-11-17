class CreateOffices < ActiveRecord::Migration[7.0]
  def change
    create_table :offices do |t|
      t.string :building
      t.integer :floor
      t.integer :number

      t.timestamps
    end
  end
end
