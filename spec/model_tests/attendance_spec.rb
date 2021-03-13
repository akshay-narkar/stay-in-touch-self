require 'rails_helper'

describe Attendance, type: :model do
  let(:user) { User.create(username: 'user') }
  let(:evt) { Event.create(description: 'Test description', eventdate: Date.current) }
  subject { Attendance.new(attendee: user, attended_event: evt) }

  context 'Associations' do
    it { should belong_to(:attendee).class_name('User') }
    it { should belong_to(:attended_event).class_name('Event') }
  end

  context 'Validations' do
    it { should validate_presence_of(:attendee_id) }
    it { should validate_presence_of(:attended_event_id) }
  end

  context 'Relations' do
    it 'attendee is equal to user' do
      expect(subject.attendee).to eq(user)
    end

    it 'attended_event is equal to event' do
      expect(subject.attended_event).to eq(evt)
    end
  end
end
