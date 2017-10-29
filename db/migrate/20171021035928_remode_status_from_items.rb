class RemodeStatusFromItems < ActiveRecord::Migration[5.0]
  def change
      reversible do |dir|
          change_table :items do |t|
              dir.up   { t.change :status, :string }
              dir.down { t.change :status, :integer }
          end
      end
  end
end
