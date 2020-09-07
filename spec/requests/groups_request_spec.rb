require 'rails_helper'

RSpec.describe "Groups", type: :request do
  
  let(:user) { create(:user, email: 'sample@gmail.com') }

  describe 'group#new' do
    context 'ユーザーがログインしている場合' do
      before do
        sign_in user
      end

      it 'new.html.hamlリクエストが成功する' do
        get new_group_path
        expect(response.status).to eq 200
      end    
    end 

    context 'ユーザーがログインしていない場合' do
      it 'ログイン画面に遷移する' do
        get new_group_path
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'group#create' do

    context 'パラメーターが妥当な場合' do
      let(:params) { { group: attributes_for(:group, user_ids: ["", user.id]) } }

      before do
        sign_in user
      end

      it 'リクエストが成功する' do
        post groups_path, params: params
        expect(response.status).to eq 302
      end
    end
  end

  describe 'group#edit' do
    let(:group) { create(:group) }

    before do
      sign_in user
    end

    it 'リクエストが成功する' do
      get edit_group_path group
      expect(response.status).to eq 200
    end

    it 'グループ名が表示されている' do
      get edit_group_path group
      expect(response.body).to include group.name
    end

    it '詳細が表示されている' do
      get edit_group_path group
      expect(response.body).to include group.detail
    end    
  end
end
