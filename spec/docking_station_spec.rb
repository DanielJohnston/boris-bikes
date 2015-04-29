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

end
