require 'rails_helper'

describe User, type: :model do
  let(:user) { User.create(username: 'user') }

  context 'Associations' do
    it { should have_many(:events).class_name('Event').with_foreign_key('creator_id') }
    it { should have_many(:attended_events).through('attendances') }
    it { should have_many(:attendances).with_foreign_key('attendee_id') }
  end

  context 'Validations' do
    it { should validate_presence_of(:username).with_message('Needs to be present') }
    it { should validate_uniqueness_of(:username).with_message('Already taken. Please try a new one') }
    it {
      should validate_length_of(:username).is_at_least(3).with_message('Username should be atleast 3 characters long')
    }
  end
end
