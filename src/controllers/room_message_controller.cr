class RoomMessageController < ApplicationController
  getter room_message = RoomMessage.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_room_message }
  end

  def index
    room_messages = RoomMessage.all
    render "index.slang"
  end

  def show
    render "show.slang"
  end

  def new
    render "new.slang"
  end

  def edit
    render "edit.slang"
  end

  def create
    room_message = RoomMessage.new room_message_params.validate!
    if room_message.save
      redirect_to action: :index, flash: {"success" => "Created room_message successfully."}
    else
      flash[:danger] = "Could not create RoomMessage!"
      render "new.slang"
    end
  end

  def update
    room_message.set_attributes room_message_params.validate!
    if room_message.save
      redirect_to action: :index, flash: {"success" => "Updated room_message successfully."}
    else
      flash[:danger] = "Could not update RoomMessage!"
      render "edit.slang"
    end
  end

  def destroy
    room_message.destroy
    redirect_to action: :index, flash: {"success" => "Deleted room_message successfully."}
  end

  private def room_message_params
    params.validation do
      required :room_id
      required :user_id
      required :message
    end
  end

  private def set_room_message
    @room_message = RoomMessage.find! params[:id]
  end
end
