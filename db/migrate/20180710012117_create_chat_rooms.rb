class CreateChatRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_rooms do |t|

      t.string      :title    # 방이름
      t.string      :master_id # 방장
      t.integer     :max_count # 최대 인원수
      t.integer     :admissions_count, default: 0 # 디폴트값 0 줌
      t.timestamps
    end
  end
end
