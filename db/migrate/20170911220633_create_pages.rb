class CreatePages < ActiveRecord::Migration[5.1]
  def up
    create_table :pages do |t|
      t.string :name, index: true
      # t.index :name # using `index: true` instead
      t.integer :permalink
      t.integer :position
      t.boolean :visible
      t.belongs_to :subject, foreign_key: true
      t.timestamps
    end
  end
  def down
    drop_table :pages
  end
end
