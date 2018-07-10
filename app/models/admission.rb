class Admission < ApplicationRecord
      # 양쪽에 걸침
    belongs_to  :user       # 캐시 지정 true : 자동으로 업데이트가 됨.    
    belongs_to  :chat_room, counter_cache: true  

    after_commit :user_join_chat_room_notification, on: :create    

    def user_join_chat_room_notification
                        # 채널명   이벤트명       / 어느 방에 들어갔느냐?       / json으로 바꿔줌.
        Pusher.trigger('chat_room', 'join', {chat_room_id: self.chat_room_id, email: self.user.email}.as_json)
                                                                        # show.html.erb에서 email 변수를 사용하기 위해서 넣어줌.     
    end
end
