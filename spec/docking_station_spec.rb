require 'docking_station'

describe DockingStation do
  #expects method release_bike to give result
  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    subject.dock Bike.new
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  #test a new docking station (i.e. no bikes) returns error when release_bike run
  describe 'release_bike' do
    it 'raises error when attempting to release a non-existent bike' do
      expect {subject.release_bike}.to raise_error 'No bikes available'
    end
  end

  it 'raises error when docking station is full' do
    20.times{subject.dock Bike.new}
    expect {subject.dock Bike.new}.to raise_error 'Station full'
  end

  #expects method bike_capacity= to give result
  it { is_expected.to respond_to :bike_capacity= }

  #test that if we change capacity to 35, then we can store 35 bikes then return error for 36th
  it 'stores 35 bikes if capacity changed to 35, then raises error on 36th' do
    subject.bike_capacity = 35
    35.times{subject.dock Bike.new}
    expect { subject.dock Bike.new}.to raise_error 'Station full'
  end

  #same as feature test - put one broken bike into station, try to release, raise error
  it 'will not release a broken bike if it is the only one in docking station' do
    bike = Bike.new
    bike.report_broken
    subject.dock bike
    expect { subject.release_bike}.to raise_error 'No bikes available'
  end

  #given 15 bikes in station - 14 are broken, code has to find one working bike to release.
  it 'in a station with a capacity of 15 bikes, it will find the one working bike ' do
    subject.bike_capacity = 15
    bike = Bike.new
    subject.dock bike
    otherbike = Bike.new
    otherbike.report_broken
    14.times{subject.dock(otherbike)}
    anotherbike = subject.release_bike
    expect(anotherbike).to be_working
  end



  #given 15 bikes in station - 12 are working and 3 are not - find and release a working bike




end
