class RoomTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room_type, only: [ :show, :update, :destroy ]

  # GET /room_types
  def index
    @room_types = RoomType.all
    render json: @room_types
  end

  # GET /room_types/:id
  def show
    render json: @room_type
  end

  # POST /room_types
  def create
    @room_type = RoomType.new(room_type_params)

    if @room_type.save
      render json: @room_type, status: :created
    else
      render json: @room_type.errors, status: :unprocessable_entity
    end
  end

  # PUT /room_types/:id
  def update
    if @room_type.update(room_type_params)
      render json: @room_type
    else
      render json: @room_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /room_types/:id
  def destroy
    @room_type.destroy
    head :no_content
  end

  private

  def set_room_type
    @room_type = RoomType.find(params[:id])
  end

  def room_type_params
    params.require(:room_type).permit(:name, :description)
  end
end
