class ChangeDiscountTypeToDiscType < ActiveRecord::Migration[5.0]
  def change
    rename_column :discounts, :type, :discount_type
  end
end
