class CreatePetTable < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :type
      t.string :address
      t.string :phone
      t.string :email
      t.string :description
      t.string :photo
      t.string :userid
    end
  end
end
