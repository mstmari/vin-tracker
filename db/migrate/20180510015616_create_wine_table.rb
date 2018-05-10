class CreateWineTable < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :name
      t.integer :user_id
    end
  end
end
