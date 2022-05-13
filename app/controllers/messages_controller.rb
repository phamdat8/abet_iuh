class MessagesController < ApplicationController
  def create
    Message.create(content: params['content'], user_id: current_user.id, room_id: params['room_id'])
  end

  def index
    data = []

    @messages = Message.where(room_id: params['room_id'])
                        .where("id > #{params['mess_id']}")
    @messages.each do |mes|
      new_data = {}
      new_data['id'] = mes.id
      new_data['content'] = mes.content
      new_data['full_name'] = mes.user.full_name
      new_data['user_id'] = mes.user_id
      new_data['time'] = mes.created_at.to_formatted_s(:short)
      data << new_data
    end
    render :json => data
  end
end
