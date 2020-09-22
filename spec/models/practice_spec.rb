require 'rails_helper'

RSpec.describe Practice, type: :model do
  describe "#create" do
    context 'practiceが保存できる場合' do
      let(:user) { create(:user) }
      
      it "全情報登録できる" do
        expect(build(:practice, manager_id: user.id)).to be_valid
      end
    end

    context 'practiceが保存できる場合' do
      let(:user) { create(:user) }
      it "nameが無いと登録できない" do
        practice = build(:practice, name: "")
        practice.valid?
        expect(practice.errors[:name]).to include("を入力してください")
      end

      it "shuttle_idが無いと登録できない" do
        practice = build(:practice, shuttle_id: "" )
        practice.valid?
        expect(practice.errors[:shuttle_id]).to include("を入力してください")
      end

      it "manager_idが無いと登録できない" do
        practice = build(:practice, manager_id: "")
        practice.valid?
        expect(practice.errors[:manager_id]).to include("を入力してください")
      end
      
    end
  end
end