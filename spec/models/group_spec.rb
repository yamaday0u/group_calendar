require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @group = FactoryBot.build(:group)
  end

  describe '#create' do
    context 'successfully' do
      it 'is valid with name, outline, task' do
        expect(@group).to be_valid
      end
      it 'is valid without content' do
        @group.outline = ''
        expect(@group).to be_valid
      end
      it 'is valid without task' do
        @group.task = ''
        expect(@group).to be_valid
      end
    end

    context 'unsuccessfully' do
      it 'is invalid without name' do
        @group.name = ''
        @group.valid?
        expect(@group.errors.full_messages).to include("Name can't be blank")
      end
    end
  end
end
