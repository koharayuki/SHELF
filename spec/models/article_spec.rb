require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @article = FactoryBot.build(:article)
  end

  describe '記事投稿' do
    context '投稿できるとき' do
      it '必要事項(title、text, genre_id)が過不足なく存在すれば登録できる' do
        expect(@article).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it 'titleが空では登録できない' do
        @article.title = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Title can't be blank")
      end

      it 'textが空では登録できない' do
        @article.text = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Text can't be blank")
      end

      it 'category_idが1では登録できない' do
        @article.genre_id = 1
        @article.valid?
        expect(@article.errors.full_messages).to include("Genre can't be blank")
      end
    end
  end
end
