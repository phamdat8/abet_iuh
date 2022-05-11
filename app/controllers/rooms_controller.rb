class RoomsController < ApplicationController
  before_action :init
  def index
  end

  def new
  end

  def init
    @rooms = Room.all
    @room = params[:id].present? ? Room.find(params[:id]) : Room.new
  end

  def create
    Room.create(
      name: params['room']['name'],
      user_id: current_user.id
    )
    render :index
  end

  def show
    @mes = Message.where(room_id: params[:id])
  end
end
