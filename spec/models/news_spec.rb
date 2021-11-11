require 'rails_helper'

RSpec.describe News, type: :model do
  before do
    @news = FactoryBot.build(:news)
  end
  
  describe '#create' do
    context 'successfully' do
      it 'is valid with title, content' do
        expect(@news).to be_valid
      end
    end

    context 'unsuccessfully' do
      it 'is invalid without title' do
        @news.title = ''
        @news.valid?
        expect(@news.errors.full_messages).to include("Title can't be blank")
      end

      it 'is invalid without content' do
        @news.content = ''
        @news.valid?
        expect(@news.errors.full_messages).to include("Content can't be blank")
      end
    end
  end
end
