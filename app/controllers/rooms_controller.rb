class RoomsController < ApplicationController
  def index
    @rooms = current_user.rooms
    @room = Room.new
    @users = User.except_me(current_user)
  end

  def show
    @rooms = current_user.rooms
    @users = User.except_me(current_user)
    @room = Room.new
    @single_room = Room.find(params[:id])
    @message = Message.new
    @messages = @single_room.messages

    render "index"
  end

  def create
    @room = Room.create(name: params["room"]["name"])
  end
end
