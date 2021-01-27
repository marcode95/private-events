class AddUserToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :creator, references: :users, index: true 
  end
end
