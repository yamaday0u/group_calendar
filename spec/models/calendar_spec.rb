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
    end
  end
end
