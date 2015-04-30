feature 'member of public returns bike to docking station' do
  scenario 'docking station full' do
    docking_station = DockingStation.new
    20.times{docking_station.dock Bike.new}
    expect { docking_station.dock Bike.new }.to raise_error 'Station full'
  end
  scenario 'admin changes capacity, docking station works at higher capacity' do
    docking_station = DockingStation.new
    docking_station.bike_capacity = 35
    35.times{docking_station.dock Bike.new}
    expect { docking_station.dock Bike.new}.to raise_error 'Station full'
  end
  scenario 'bike can be reported broken when returned' do
    docking_station = DockingStation.new
    bike = Bike.new
    bike.report_broken
    expect { docking_station.dock bike }.not_to raise_error
  end
end
