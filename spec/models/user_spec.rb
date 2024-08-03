require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do

      end
      it '重複したemailが存在する場合は登録できない' do
        
      end
      it 'mailは@を含まないと登録できない' do
        
      end
      it 'passwordが空では登録できない' do
        
      end
      it 'passwordが5文字以下では登録できない' do
        
      end
      it 'passwordが全角では登録できない' do
        
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        
      end
    end
  end
end