class AddSortableToRecordField < ActiveRecord::Migration[5.0]
  def change
    # specify order
    RecordField.order('id desc').each.with_index do |item, position|
      item.update_attribute :sort, position
    end
    change_column :record_fields, :sort, :integer, :null => false

    add_index :record_fields, [:sort]
  end
end
