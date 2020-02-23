class CreateBillboards < ActiveRecord::Migration[6.0]
  def change
    create_table :billboards do |t|
      t.string :name
      t.string :location
      t.string :genre

      t.timestamps
    end
  end
end
