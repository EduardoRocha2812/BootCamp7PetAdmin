class AddTypeToDiscounts < ActiveRecord::Migration[5.0]
  def change
    add_column :discounts, :type, :integer
  end
end
