require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do

    context '新規登録がうまくいくとき' do

      it "nicknameとemail、passwordとpassword_confirmation,first_nameとlast_name,first_name_katakanaとlast_name_katakana,birthdayが存在するとき" do
        expect(@user).to be_valid
      end

    end

    context '新規登録がうまくいかないとき' do

     it "ニックネームが存在しないとき" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")

     end

     it "メールアドレスが存在しないとき" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end

     it "メールアドレスが一意性でないとき" do
      @user.email = 'aaaa1111@gmail.com'
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
     end

     it "メールアドレスは、@を含まないとき" do
      @user.email = 'aaaaaa.gmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
     end

      it "パスワードが存在しないとき" do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password is invalid")
      end

      it "パスワードは、6文字以上でないとき（6文字が入力されていれば、登録が可能なこと）" do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)", "Password is invalid")
      end

      it "パスワードは、半角英数字混合でないとき（半角英数字が混合されていれば、登録が可能なこと）" do
        @user.password = 'aaaaaaaa'
        @user.password_confirmation = 'aaaaaaaa'
        @user.valid? 
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "パスワードは、確認用を含めて2回入力しないとき" do 
        @user.password = 'aaaa1111'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "パスワードとパスワード（確認用）の値が一致しないとき" do
        @user.password = 'aaaa1111'
        @user.password_confirmation = 'bbbb1111'
        @user.valid? 
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end


      it "ユーザー本名は、名字と名前が存在しない" do
        @user.first_name = ''
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "First name can't be blank")
      end

      it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力していないとき" do
        @user.first_name = '12'
        @user.last_name = '12'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid", "First name is invalid")
      end

      it "ユーザー本名のフリガナは、名字と名前が存在しない" do 
        @user.first_name_katakana = ''
        @user.last_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank", "First name katakana can't be blank")
      end

  it "ユーザー本名のフリガナは、全角（カタカナ）での入力していないとき" do
        @user.first_name_katakana = 'すわ'
        @user.last_name_katakana = 'こうへい'
        @user.valid?
      end

      it "生年月日がそれぞれ選択されていないとき" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    end
  end

end
