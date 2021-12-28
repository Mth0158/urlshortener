class CreateUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :urls do |t|
      t.string :long_url
      t.string :alias

      t.timestamps
    end
  end
end
