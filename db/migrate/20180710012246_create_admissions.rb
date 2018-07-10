class CreateAdmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :admissions do |t|
    
      t.references    :chat_room
      t.references    :user       # 양쪽 연결 시켜주어야함.
      
      t.timestamps
    end
  end
end
