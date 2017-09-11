class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.string   :name, index: true
      t.integer  :position
      t.boolean  :visible
      t.string   :content_type, index: true
      t.text     :content
      t.belongs_to :page, foreign_key: true
        # not sure about fkey'ing :subject w/ hmthru
      t.timestamps
    end
  end
end
