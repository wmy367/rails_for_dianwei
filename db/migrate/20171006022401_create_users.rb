class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :avatar
      t.string :school_serial
      t.string :phone
      t.string :curr_localtion
      t.string :gender
      t.timestamps
    end
  end
end
