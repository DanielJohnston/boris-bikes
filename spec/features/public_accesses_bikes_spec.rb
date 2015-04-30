

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

  scenario 'docking station does not release broken bikes' do
    docking_station = DockingStation.new
    bike = Bike.new
    bike.report_broken
    docking_station.dock bike
    expect { docking_station.release_bike }.to raise_error 'No bikes available'
  end
end
