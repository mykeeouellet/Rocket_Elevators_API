class CreateTextToSpeeches < ActiveRecord::Migration[5.2]
  def change
    create_table :text_to_speeches do |t|

      t.timestamps
    end
  end
end
