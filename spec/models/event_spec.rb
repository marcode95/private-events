require 'rails_helper'

RSpec.describe Event, type: :model do
  before :each do
    @user = User.create(name: 'bello')
    @event1 = @user.created_events.create(title: 'house party', description: 'party at my place', date: '10.02.2021')
  end

  context 'has associations and validations' do
    it 'can be created' do
      expect(Event.first).to eq(@event1)
    end

    it 'should make sure the creator of the event is the current user' do
      expect(@event1.creator).to eq(@user)
    end

    it 'should be valid if title is not nil' do
      @event1.title = nil
      expect(@event1).to_not be_valid
    end

    it 'should be valid if description is not nil' do
      @event1.description = nil
      expect(@event1).to_not be_valid
    end

    it 'should be valid if date is not nil' do
      @event1.date = nil
      expect(@event1).to_not be_valid
    end
  end
end
