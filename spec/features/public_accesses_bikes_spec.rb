

feature 'user takes working bike from docking station' do
  scenario 'docking station releases a working bike' do
    docking_station = DockingStation.new
    docking_station.dock Bike.new
    bike = docking_station.release_bike
    expect(bike).to be_working
  end

  scenario 'docking station returns error when no bikes' do
    docking_station = DockingStation.new
    expect {docking_station.release_bike}.to raise_error 'No bikes available'
  end
end
