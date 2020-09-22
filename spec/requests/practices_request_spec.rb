require 'rails_helper'

RSpec.describe "Practices", type: :request do
  let(:user) { create(:user, email: 'sample@gmail.com') }

  describe "practice#new" do
    context "ログインしている場合" do
      before do
        sign_in user
      end

      it "リクエストが成功する" do
        get new_practice_path
        expect(response.status).to  eq 200
      end
    end

    context "ユーザーがログインしていない場合" do
      it "ログイン画面に遷移する" do
        get new_practice_path
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "practice#create" do
    context "パラメーターが妥当な場合" do
      let(:shuttle) { create(:shuttle) }
      let(:params) { {practice: attributes_for(:practice, user_ids: ["", user.id], shuttle_id: shuttle )} }

      before do
        sign_in user
      end

      it "リクエストが成功する" do
        post practices_path params: params
        expect(response.status).to eq 302
      end

    end
  end
end
