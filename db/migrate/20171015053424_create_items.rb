class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :info
      t.string :phone
      t.string :email
      t.integer :status
      t.string :tag
      t.timestamps
    end
  end
end
