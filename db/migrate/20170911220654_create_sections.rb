class CreateSections < ActiveRecord::Migration[5.1]
  def up
    create_table :sections do |t|
      t.string :name
      t.integer :position
      t.boolean :visible, default: false
      t.string :content_type
      t.text :content
      t.belongs_to :page, foreign_key: true, index: true
      t.timestamps
    end
  end

  def down
    drop_table :sections
  end
end
