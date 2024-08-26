class CreateSupporttickets < ActiveRecord::Migration[6.1]
  def change
    create_table :supporttickets do |t|
      t.string :title
      t.text :description
      t.string :status
      t.datetime :open_date
      t.datetime :closed_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
