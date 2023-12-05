class CreateCateories < ActiveRecord::Migration[7.0]
  def change
    create_table :cateories do |t|

      t.timestamps
    end
  end
end
