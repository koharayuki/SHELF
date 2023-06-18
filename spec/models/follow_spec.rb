require 'rails_helper'

RSpec.describe Follow, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @another_user = FactoryBot.create(:user)
    @follow = FactoryBot.build(:follow, follower_id: @user.id, following_id: @another_user.id)

  end

  describe 'フォロー/フォロワー登録' do
    context 'フォロー/フォロワー登録ができるとき' do
      it '必要事項(user_id,article_id)が過不足なく存在すればお気に入り登録できる' do
        expect(@follow).to be_valid
      end
    end


    context 'フォロー/フォロワー登録ができないとき' do
      it 'follower_idがないと登録できない' do
        @follow.follower = nil
        @follow.valid?
        expect(@follow.errors.full_messages).to include("Followerを入力してください", "Followerを入力してください")
      end

      it 'following_idがないと登録できない' do
        @follow.following = nil
        @follow.valid?
        expect(@follow.errors.full_messages).to include("Followingを入力してください", "Followingを入力してください")
      end
    end
  end
end