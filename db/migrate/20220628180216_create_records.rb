class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.text :desc

      t.timestamps
    end
  end
end
