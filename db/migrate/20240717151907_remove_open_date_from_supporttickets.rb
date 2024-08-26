class RemoveOpenDateFromSupporttickets < ActiveRecord::Migration[6.1]
  def change
    remove_column :supporttickets, :open_date, :datetime
  end
end
