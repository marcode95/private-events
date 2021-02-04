require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create(name: 'bello')
    @event1 = @user.created_events.create(title: 'house party', description: 'party at my place', date: '03.02.2021')
    @event2 = @user.created_events.create(title: 'pub crawl', description: 'pub crawl in inner city', date: '10.02.2021')
  end

  context 'has associations and validations' do
    it 'can be created' do
      expect(User.first).to eq(@user)
    end

    it 'connects the created events' do
      expect(@user.created_events).to eq([@event1, @event2])
    end

    it 'should be valid if name is not nil' do
      assert @user.valid?
    end
  end
end