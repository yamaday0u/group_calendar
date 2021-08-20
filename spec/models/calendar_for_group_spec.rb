require 'rails_helper'

RSpec.describe CalendarForGroup, type: :model do
  before do
    @group_calendar = FactoryBot.build(:calendar_for_group)
  end

  describe '#create' do
    context 'successfully' do
      it 'is valid with title, content, start_time, end_time' do
        expect(@group_calendar).to be_valid
      end
      it 'is valid without content' do
        @group_calendar.content = ''
        expect(@group_calendar).to be_valid
      end
      it 'is valid without end_time' do
        @group_calendar.end_time = ''
        expect(@group_calendar).to be_valid
      end
    end
    context 'unsuccessfully' do
      it 'is invalid without title' do
        @group_calendar.title = ''
        @group_calendar.valid?
        expect(@group_calendar.errors.full_messages).to include("Title can't be blank")
      end
      it 'is invalid without user' do
        @group_calendar.user = nil
        @group_calendar.valid?
        expect(@group_calendar.errors.full_messages).to include('User must exist')
      end
      it 'is invalid without group' do
        @group_calendar.group = nil
        @group_calendar.valid?
        expect(@group_calendar.errors.full_messages).to include('Group must exist')
      end
      it 'is invalid without start_time' do
        
      end
      it 'is invalid if start time is late than end time' do
        @group_calendar.start_time = @group_calendar.end_time + 60 # Set start_time 1 minute later than end_time
        @group_calendar.valid?
        expect(@group_calendar.errors.full_messages).to include('End time must set be late than Start time')
      end
    end
  end
end
