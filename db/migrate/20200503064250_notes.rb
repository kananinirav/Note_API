class Notes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :note_title
      t.string :note_details
      t.timestamps null: false
    end
  end
end
