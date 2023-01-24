class CreateOrder < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :title, null: false, index: { unique: true }
      t.timestamps
    end
  end
end
