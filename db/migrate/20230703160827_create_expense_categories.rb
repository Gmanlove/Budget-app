class CreateExpenseCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :expense_categories do |t|
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.bigint :expense_id, null: false
      t.bigint :category_id, null: false

      t.index :expense_id
      t.index :category_id

      t.timestamps
    end
  end
end
