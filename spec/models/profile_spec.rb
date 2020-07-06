require 'rails_helper'

describe Profile do
  describe '#create' do

    it "全情報登録できる" do
      profile = build(:profile)
      profile.valid?
    end

    it "phonenumberが無くても登録できる" do
      profile = build(:profile, phonenumber: "")
      profile.valid?
    end

    it "oldがない場合は登録できない" do
      profile = build(:profile, old: "")
      profile.valid?
      expect(profile.errors[:old]).to include("を入力してください")
    end

    it "jobがない場合は登録できない" do
      profile = build(:profile, job: "")
      profile.valid?
      expect(profile.errors[:job]).to include("を入力してください")
    end

    it "experienceがない場合は登録できない" do
      profile = build(:profile, experience: "")
      profile.valid?
      expect(profile.errors[:experience]).to include("を入力してください")
    end
    
    it "practice_timeがない場合は登録できない" do
      profile = build(:profile,  practice_time: "")
      profile.valid?
      expect(profile.errors[:practice_time]).to include("を入力してください")
    end

    it "clubが無くても登録できる" do
      profile = build(:profile, club: "")
      profile.valid?
    end

    it "detailが無くても登録できる" do
      profile = build(:profile, detail: "")
      profile.valid?
    end

    it "avatarが無くても登録できる" do
      profile = build(:profile, avatar: "")
      profile.valid?
    end

    it "user_idが無くても登録できる" do
      profile = build(:profile, user_id: "")
      profile.valid?
    end

  end
end
