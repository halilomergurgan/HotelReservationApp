class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservation, only: [ :show, :destroy ]

  def index
    @reservations = Reservation.all
    render json: @reservations
  end

  def show
    @reservation = Reservation.find(params[:id])
    render json: @reservation
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    head :no_content
  end

  # POST /reservations
  def create
    #Rails.logger.debug "Received POST data: #{params.inspect}"
    guest = Guest.find_or_create_by!(email: guest_params[:email]) do |g|
      g.first_name = guest_params[:first_name]
      g.last_name = guest_params[:last_name]
    end

    room = Room.joins(:room_type).find_by!(
      name: reservation_params[:room_name],
      room_types: { name: reservation_params[:room_type] }
    )

    if reservation_params[:channel].present?
      channel = Channel.find_by!(name: reservation_params[:channel])
      hotel = nil
    elsif reservation_params[:hotel].present?
      hotel = Hotel.find_by!(name: reservation_params[:hotel])
      channel = nil
    else
      render json: { error: "Either channel or hotel must be provided" }, status: :unprocessable_entity
      return
    end

    @reservation = guest.reservations.new(
      room: room,
      start_date: reservation_params[:start_date],
      end_date: reservation_params[:end_date],
      channel: channel,
      hotel: hotel,
      user_id: current_user.id
    )

    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:room_name, :room_type, :start_date, :end_date, :channel, :hotel)
  end

  def guest_params
    params.require(:guest).permit(:email, :first_name, :last_name)
  end
end
