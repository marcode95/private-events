require 'rails_helper'

RSpec.describe EventAttendee, type: :model do
  before(:each) do
    @user = User.create(name: 'bello')
    @event = @user.created_events.create(title: 'house party', date: '10.02.2021', description: 'Test event')
    @event_attendee1 = @user.event_attendees.create(attended_event_id: @event.id)
    @event_attendee2 = @event.event_attendees.create(event_attendee_id: @user.id)
  end

  it 'Can be created by the user' do
    expect(EventAttendee.first).to eq(@event_attendee1)
  end

  it 'Can be created by the event' do
    expect(EventAttendee.second).to eq(@event_attendee2)
  end
end
