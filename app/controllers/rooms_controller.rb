class RoomsController < ApplicationController
  before_action :authenticate_user!  # Eğer JWT doğrulaması gerekiyorsa
  before_action :set_room, only: [ :show, :update, :destroy ]

  # GET /rooms
  def index
    @rooms = Room.all
    render json: @rooms
  end

  # GET /rooms/:id
  def show
    render json: @room
  end

  # POST /rooms
  def create
    @room = Room.new(room_params)

    if @room.save
      render json: @room, status: :created
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # PUT /rooms/:id
  def update
    if @room.update(room_params)
      render json: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rooms/:id
  def destroy
    @room.destroy
    head :no_content
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, :room_type_id, :price)
  end
end
