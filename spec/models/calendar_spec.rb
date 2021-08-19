require 'rails_helper'

RSpec.describe Calendar, type: :model do
  before do
    @calendar = FactoryBot.build(:calendar)
  end

  describe '#create' do
    context 'successfully' do
      it 'is valid with title, content, start_time, end_time' do
        expect(@calendar).to be_valid
      end
      it 'is valid without content' do
        @calendar.content = ''
        expect(@calendar).to be_valid
      end
      it 'is valid without end_time' do
        
      end
    end

    context 'unsuccessfully' do
      it 'is invalid without title' do
        @calendar.title = ''
        @calendar.valid?
        expect(@calendar.errors.full_messages).to include("Title can't be blank")
      end
      it 'is invalid without user' do
        @calendar.user = nil
        @calendar.valid?
        expect(@calendar.errors.full_messages).to include('User must exist')
      end
      it 'is invalid without start_time' do
        
      end
      it 'is invalid if start_time is late than end time' do
        @calendar.start_time = @calendar.end_time + 60 # Set start_time 1 minute later than end_time
        @calendar.valid?
        expect(@calendar.errors.full_messages).to include('End time must set be late than Start time')
      end
    end
  end
end
