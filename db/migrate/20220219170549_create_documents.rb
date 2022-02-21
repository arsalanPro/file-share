class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.boolean :shared, default: false, null: false
      t.string :key, index: {unique: true}, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
