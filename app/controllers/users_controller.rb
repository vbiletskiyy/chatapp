class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @rooms = Room.all
    @users = User.except_me(current_user)
    @room = Room.new
    @message = Message.new
    room_name = get_name(@user, current_user)
    @single_room = Room.find_by(name: room_name) || Room.create_private_room([@user, current_user], room_name)
    Rails.logger.info(22222222)
    Rails.logger.info(@single_room)
    @messages = @single_room.messages

    render "rooms/index"
  end

  def get_name(user1, user2)
    users = [user1, user2].sort
    "private_#{users[0].id}_#{users[1].id}"
  end
end
