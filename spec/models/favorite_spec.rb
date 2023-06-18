require 'rails_helper'

  RSpec.describe Favorite, type: :model do
    before do
      @user = FactoryBot.create(:user)
      @article = FactoryBot.create(:article)
      @favorite = FactoryBot.build(:favorite, user_id: @user.id, article_id: @article.id)
    end

    describe 'お気に入り登録' do
      context 'お気に入り登録ができるとき' do
        it '必要事項(user_id,article_id)が過不足なく存在すればお気に入り登録できる' do
          expect(@favorite).to be_valid
        end
      end


      context 'お気に入り登録ができないとき' do
        it 'userが紐づいていないと登録できない' do
          @favorite.user = nil
          @favorite.valid?
          expect(@favorite.errors.full_messages).to include("Userを入力してください")
        end

        it 'articleが紐づいていないと登録できない' do
          @favorite.article = nil
          @favorite.valid?
          expect(@favorite.errors.full_messages).to include("Articleを入力してください")
        end
      end
  end
end

