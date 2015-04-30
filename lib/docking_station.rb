require_relative 'bike'

class DockingStation
  attr_accessor :bike_capacity
  def initialize
    @bike_capacity = 20
    @bikes = []
  end
  def release_bike
    fail 'No bikes available' if empty? || @bikes.last.broken?
    @bikes.pop
  end
  def dock(bike)
    fail 'Station full' if full? #there's a bike in the station
    @bikes << bike
  end


  private

  attr_reader :bikes

  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.length >=@bike_capacity
  end
end
