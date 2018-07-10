class ChatRoom < ApplicationRecord

    has_many    :admissions
    has_many    :users, through: :admissions
    
    has_many    :chatchats
    after_commit :create_chat_room_notification, on: :create
                                            # 만들어 질 때
    def create_chat_room_notification
                        # 채널명  / 발생이벤트 / # 데이터를 보낼 곳
        Pusher.trigger('chat_room', 'create', self.as_json)
                                                # json을 통째로 넣어줌! => 인덱스에서 처리함!
                                            # 이 이벤트에 전달해줄 데이터( json 형태 )    
    end

                   # 파라미터로 넘어온 user 객체
    def user_admit_room(user)   # self가 없으므르 인스턴스 메서드
        Admission.create(user_id: user.id, chat_room_id: self.id)
        # ChatRoom이 하나 만들어지고 나면 다음 메서드를 같이 실행한다.
    end



end
