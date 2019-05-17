require 'rails_helper'
describe User do
  describe '#create' do

    # ニックネーム,メアド,パス,再パス、その他があれば登録できる。
    it "is valid with factory bot data" do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end
    # ニックネームがないと登録不可
    it "is invalid without a nickname" do
     user = FactoryBot.build(:user, nickname: "")
     user.valid?
     expect(user.errors[:nickname]).to include("can't be blank")
    end
    # メールアドレスがないと登録不可
    it "is invalid without a email" do
     user = FactoryBot.build(:user, email: "")
     user.valid?
     expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid with a duplicate email address" do
      FactoryBot.create(:user)
      another_user = FactoryBot.build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    #last_name_kanaがカタカナではない時は登録できない
    it "is invalid if last_name_kana is not カタカナ" do
     user = FactoryBot.build(:user, last_name_kana: "1")
     user.valid?
     expect(user.errors[:last_name_kana]).to include("is invalid")
    end

    #first_name_kanaがカタカナではない時は登録できない
    it "is invalid if first_name_kana is not カタカナ" do
     user = FactoryBot.build(:user, first_name_kana: "1")
     user.valid?
     expect(user.errors[:first_name_kana]).to include("is invalid")
    end

    it "is invalid with a email not includes @ " do
      user = FactoryBot.build(:user, email: "aaaaa")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end

    it "is invalid with a email includes no character before @ " do
      user = FactoryBot.build(:user, email: "@aaa")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end

    it "is invalid with a email includes no character after @ " do
      user = FactoryBot.build(:user, email: "aaaa@")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end

    it "is invalid with a email includes non-alphanumeric characters " do
      user = FactoryBot.build(:user, email: "aaあa@aaa")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end

    it "is invalid without a password_confirmation although with a password" do
      user = FactoryBot.build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid with a password that has less than 5 characters " do
      user = FactoryBot.build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end

    it "is invalid without a first_name" do
      user = FactoryBot.build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid without a last_name" do
      user = FactoryBot.build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "is invalid without a first_name_kana" do
      user = FactoryBot.build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    it "is invalid without a last_name_kana" do
      user = FactoryBot.build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end

  end
end
