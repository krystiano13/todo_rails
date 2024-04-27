class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :text
      t.string :user
      t.boolean :done

      t.timestamps
    end
  end
end
