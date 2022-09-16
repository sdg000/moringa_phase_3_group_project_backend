class CreateStudent < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :hometown
      t.date :date_admitted
      t.integer :gpa
    end
  end
end
