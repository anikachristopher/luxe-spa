class AddTitleToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :title, :string
  end
end
