require 'rails_helper'

RSpec.describe Chat, type: :model do
  before do
    @chat = FactoryBot.build(:chat)
  end

  describe '#create' do
    context 'successfully' do
      it 'is valid with text' do
        expect(@chat).to be_valid
      end
    end

    context 'unsuccessfully' do
      it 'is invalid without text' do
        @chat.text = ''
        @chat.valid?
        expect(@chat.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end
