require 'rails_helper'

RSpec.describe Group, type: :model do
  describe '#create' do
    context 'グループが保存できる場合' do
      it "全情報登録できる" do
        expect(build(:group)).to be_valid
      end
      
      it "detailがなくても登録できる" do
        expect(build(:group, detail: nil)).to be_valid
      end

      it "group_avatarがなくても登録できる" do
        expect(build(:group, group_avatar: nil)).to be_valid
      end
    end
  
    context 'グループが保存できない場合' do
      it "nameがなければ登録できない" do
        group = build(:group, name: "")
        group.valid?
        expect(group.errors[:name]).to include("を入力してください")
      end  
    end
  end
end