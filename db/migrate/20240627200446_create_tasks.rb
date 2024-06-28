class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.text :task_description
      t.boolean :checked

      t.timestamps
    end
  end
end
