require "./spec_helper"

def room_hash
  {"name" => "Fake"}
end

def room_params
  params = [] of String
  params << "name=#{room_hash["name"]}"
  params.join("&")
end

def create_room
  model = Room.new(room_hash)
  model.save
  model
end

class RoomControllerTest < GarnetSpec::Controller::Test
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

describe RoomControllerTest do
  subject = RoomControllerTest.new

  it "renders room index template" do
    Room.clear
    response = subject.get "/rooms"

    response.status_code.should eq(200)
    response.body.should contain("rooms")
  end

  it "renders room show template" do
    Room.clear
    model = create_room
    location = "/rooms/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Room")
  end

  it "renders room new template" do
    Room.clear
    location = "/rooms/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Room")
  end

  it "renders room edit template" do
    Room.clear
    model = create_room
    location = "/rooms/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Room")
  end

  it "creates a room" do
    Room.clear
    response = subject.post "/rooms", body: room_params

    response.headers["Location"].should eq "/rooms"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a room" do
    Room.clear
    model = create_room
    response = subject.patch "/rooms/#{model.id}", body: room_params

    response.headers["Location"].should eq "/rooms"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a room" do
    Room.clear
    model = create_room
    response = subject.delete "/rooms/#{model.id}"

    response.headers["Location"].should eq "/rooms"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
