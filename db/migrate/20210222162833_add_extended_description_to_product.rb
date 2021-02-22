class AddExtendedDescriptionToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :extended_description, :text
  end
end
