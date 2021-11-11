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
      end

      it 'is invalid without content' do
      end
    end
  end
end
