require 'rails_helper'

describe User do
  describe '#create' do

    it "nicknameがなければ登録できない" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailがない場合は登録できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "パスワードがない場合は登録できない" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "パスワードと確認パスワードが一致しない場合は登録できない" do
      user = build(:user, password: "111111")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end
    
    it "パスワードが6文字以下の場合は登録できない" do
      user = build(:user, password: "11111", password_confirmation: "11111")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end

    it "パスワードが6文字以上の場合は登録できる" do
      user = build(:user, password: "00000001", password_confirmation: "00000001")
      user.valid?
    end

  end
end
