class CreatePages < ActiveRecord::Migration[5.1]
  def up
    create_table :pages do |t|
      t.string :name
      t.integer :permalink, index: true
      t.integer :position
      t.boolean :visible, default: false
      t.belongs_to :subject, foreign_key: true, index: true
      t.timestamps
    end
  end
  def down
    drop_table :pages
  end
end
