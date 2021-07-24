require 'rails_helper'

RSpec.describe GroupCalendarChat, type: :model do
  before do
    @group_calendar_chat = FactoryBot.build(:group_calendar_chat)
  end

  describe '#create' do
    context 'successfully' do
      it 'is valid with text' do
        expect(@group_calendar_chat).to be_valid
      end
    end

    context 'unsuccessfully' do
      it 'is invalid without text' do
        @group_calendar_chat.text = ''
        @group_calendar_chat.valid?
        expect(@group_calendar_chat.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
  
end
