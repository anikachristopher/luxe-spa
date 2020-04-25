class AddDescriptionToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :description, :string
  end
end
