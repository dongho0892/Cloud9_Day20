class CreateChatchats < ActiveRecord::Migration[5.0]
  def change
    create_table :chatchats do |t|
    
      t.references    :user       #
      t.references    :chat_room  # 어느 방에서 하는가?
      t.text          :message    #
      
      
      t.timestamps
    end
  end
end
