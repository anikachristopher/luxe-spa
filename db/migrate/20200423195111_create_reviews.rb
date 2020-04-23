class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :client_id
      t.integer :appointment_id

      t.timestamps
    end
  end
end
