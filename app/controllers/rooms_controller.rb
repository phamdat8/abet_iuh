class RoomsController < ApplicationController
  before_action :init
  def index
  end

  def new
  end

  def init
    mem = Member.where(user_id: current_user.id)
    @rooms = Room.where(id: mem.pluck(:room_id))
    @room = params[:id].present? ? Room.find(params[:id]) : Room.new
  end

  def create
    room = Room.create(
      name: params['room']['name'],
      user_id: current_user.id
    )
    Member.create(room_id: room.id, user_id: current_user.id, owner: true)
    render :index
  end

  def show
    @mes = Message.where(room_id: params[:id])
    @members = Member.where(room_id: params[:id])
    @owner = @members.find_by(user_id: current_user.id).owner
  end
end
