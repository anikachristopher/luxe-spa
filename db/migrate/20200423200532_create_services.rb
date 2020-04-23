class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :name
      t.string :duration
      t.string :cost

      t.timestamps
    end
  end
end
