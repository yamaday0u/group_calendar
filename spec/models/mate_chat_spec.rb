require 'rails_helper'

RSpec.describe MateChat, type: :model do
  before do
    @mate_chat = FactoryBot.build(:mate_chat)
  end

  describe '#create' do
    context 'successfully' do
      it 'is valid with text' do
        expect(@mate_chat).to be_valid
      end
    end

    context 'unsuccessfully' do
      it 'is invalid without text' do
        @mate_chat.text = ''
        @mate_chat.valid?
        expect(@mate_chat.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end
