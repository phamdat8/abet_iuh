class MembersController < HomesController
  def create
    # byebug
    Member.create(room_id: params[:room_id], user_id: params[:user_id])
    room = Room.find(params[:room_id])
    redirect_to room_path(room)
  end
end