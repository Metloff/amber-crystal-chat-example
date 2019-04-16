require "./spec_helper"

def room_message_hash
  {"room_id" => "1", "user_id" => "1", "message" => "Fake"}
end

def room_message_params
  params = [] of String
  params << "room_id=#{room_message_hash["room_id"]}"
  params << "user_id=#{room_message_hash["user_id"]}"
  params << "message=#{room_message_hash["message"]}"
  params.join("&")
end

def create_room_message
  model = RoomMessage.new(room_message_hash)
  model.save
  model
end

class RoomMessageControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe RoomMessageControllerTest do
  subject = RoomMessageControllerTest.new

  it "renders room_message index template" do
    RoomMessage.clear
    response = subject.get "/room_messages"

    response.status_code.should eq(200)
    response.body.should contain("room_messages")
  end

  it "renders room_message show template" do
    RoomMessage.clear
    model = create_room_message
    location = "/room_messages/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Room Message")
  end

  it "renders room_message new template" do
    RoomMessage.clear
    location = "/room_messages/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Room Message")
  end

  it "renders room_message edit template" do
    RoomMessage.clear
    model = create_room_message
    location = "/room_messages/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Room Message")
  end

  it "creates a room_message" do
    RoomMessage.clear
    response = subject.post "/room_messages", body: room_message_params

    response.headers["Location"].should eq "/room_messages"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a room_message" do
    RoomMessage.clear
    model = create_room_message
    response = subject.patch "/room_messages/#{model.id}", body: room_message_params

    response.headers["Location"].should eq "/room_messages"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a room_message" do
    RoomMessage.clear
    model = create_room_message
    response = subject.delete "/room_messages/#{model.id}"

    response.headers["Location"].should eq "/room_messages"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
