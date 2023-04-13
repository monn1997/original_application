class CreateBusinessPerformances < ActiveRecord::Migration[6.1]
  def change
    create_table :business_performances do |t|
      t.integer :number_of_nominations, null: false
      t.integer :on_site_nomination, null: false
      t.integer :sales_subtotal, null: false
      t.float :duty_hours, null: false

      t.timestamps
    end
  end
end
