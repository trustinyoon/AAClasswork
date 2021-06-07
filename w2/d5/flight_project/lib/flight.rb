require_relative './flight.rb'

class Flight
  def initialize(flight_num, capacity)
    @flight_number = flight_num
    @capacity = capacity
    @passengers = []
  end

  def passengers
    @passengers
  end

  def full?
    passengers.length == @capacity ? true : false
  end

  def board_passenger(passenger)
    passengers << passenger if !full? && passenger.has_flight?(@flight_number)
  end

  def list_passengers
    passengers.map { |passenger| passenger.name }
  end

  def [](idx)
    passengers[idx]
  end

  def <<(passenger)
    board_passenger(passenger)
  end
end