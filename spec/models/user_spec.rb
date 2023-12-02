require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Emeil can't be blank")
    end
    it 'passwordが空では登録できない' do  #[ ] パスワードは、6文字以上での入力が必須であること
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do #[ ] パスワードは、半角英数字混合での入力が必須であること
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation dosen't match Passord")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has aleady been taken')

    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testgmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'last_nameが空では登録できない' do # お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last_name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      @user.first__name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First_name can't be blank")
    end
    it 'last_name_kanaがからでは登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last_name_kana can't be blank") #お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First_name_kana can't be blank")
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end


  end

end
