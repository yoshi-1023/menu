require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー情報の入力がうまくいった時' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが半角の６文字以上あれば登録できること' do
        @user.password = '1234567'
        @user.password_confirmation = '1234567'
        expect(@user).to be_valid
      end
    end

    context 'ユーザー情報の入力がうまく行かなかった時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
  
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
  
      it 'emailに＠を含むこと' do
        @user.email = 'test.gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
  
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
  
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
  
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
  
      it 'passwordが全角では登録できない' do
        @user.password = '１２３４５６'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Half-width alphanumeric")
      end
    end
  end
end
