class RoomController < ApplicationController
  getter room = Room.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_room }
  end

  def index
    rooms = Room.all
    render "index.slang"
  end

  def show
    rooms = Room.all
    user_id = session[:user_id]
    room_messages = RoomMessage.all("JOIN rooms r ON room_messages.room_id = r.id
                  JOIN users u ON room_messages.user_id = u.id
                  WHERE r.id = ?
                  ORDER BY room_messages.id ASC", @room.id)
    

    render "show.slang"
  end

  def new
    render "new.slang"
  end

  def edit
    render "edit.slang"
  end

  def create
    room = Room.new room_params.validate!
    if room.save
      redirect_to action: :index, flash: {"success" => "Created room successfully."}
    else
      flash[:danger] = "Could not create Room!"
      render "new.slang"
    end
  end

  def update
    room.set_attributes room_params.validate!
    if room.save
      redirect_to action: :index, flash: {"success" => "Updated room successfully."}
    else
      flash[:danger] = "Could not update Room!"
      render "edit.slang"
    end
  end

  def destroy
    room.destroy
    redirect_to action: :index, flash: {"success" => "Deleted room successfully."}
  end

  private def room_params
    params.validation do
      required :name
    end
  end

  private def set_room
    @room = Room.find! params[:id]
  end
end
