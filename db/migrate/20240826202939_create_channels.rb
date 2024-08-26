class CreateChannels < ActiveRecord::Migration[7.2]
  def change
    create_table :channels do |t|
      t.string :name

      t.timestamps
    end
  end
end
