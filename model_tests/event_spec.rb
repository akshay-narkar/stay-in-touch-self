require 'rails_helper'

describe Event, type: :model do
  let(:user) { User.create(username: 'user') }
  subject { Event.new(creator: user, description: 'Chess tour') }

  context 'Associations' do
    it { should belong_to(:creator).class_name('User') }
    it { should have_many(:attendees).through('attendances') }
    it { should have_many(:attendances).with_foreign_key('attended_event_id') }
  end

  context 'Validations' do
    it { should validate_presence_of(:eventdate) }
    it { should validate_presence_of(:description) }
  end

  context 'Relations' do
    it 'Event creator id is equal to user' do
      expect(subject.creator).to eq(user)
    end
  end
end
