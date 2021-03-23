require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    user = FactoryBot.create(:user)
    another_user = FactoryBot.create(:user)
    @relationship = user.follow(another_user)
  end

  describe '#create' do
    context 'successfully' do
      it 'is valid with follower_id, followed_id' do
        expect(@relationship).to be_valid
      end
    end

    context 'unsuccessfully' do
      it 'is invalid without follower_id(active relationship)' do
        @relationship.follower_id = ''
        @relationship.valid?
        expect(@relationship.errors.full_messages).to include('Follower must exist')
      end
      it 'is invalid without followed_id(passive relationship' do
        @relationship.followed_id = ''
        @relationship.valid?
        expect(@relationship.errors.full_messages).to include('Followed must exist')
      end
      it 'is invalid with duplicate relationship' do
        @relationship.save
        user = FactoryBot.create(:user)
        another_user = FactoryBot.create(:user)
        another_relationship = user.follow(another_user)
        another_relationship.follower_id = @relationship.follower_id
        another_relationship.followed_id = @relationship.followed_id
        another_relationship.valid?
        expect(another_relationship.errors.full_messages).to include('Follower has already been taken')
      end
    end
  end
end
