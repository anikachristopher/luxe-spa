class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.integer :date
      t.belongs_to :client, null: false, foreign_key: true
      t.belongs_to :services, null: false, foreign_key: true

      t.timestamps
    end
  end
end
