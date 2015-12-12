class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :title
      t.string  :description
      t.boolean :completed, default: false
      t.date    :date_completed

      t.references :user

      t.timestamps
    end
  end
end
