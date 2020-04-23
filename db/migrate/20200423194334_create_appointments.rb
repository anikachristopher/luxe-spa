class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.datetime :time
      t.references :client, null: false, foreign_key: true
      t.references :services, null: false, foreign_key: true

      t.timestamps
    end
  end
end
