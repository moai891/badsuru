require 'rails_helper'

describe GroupsController, type: :controller do

  let(:user) { create(:user, email: 'sample@gmail.com') }

  describe 'Get #new' do
    context 'ユーザーがログインしている' do
      before do
        sign_in user
      end

      it "new.html.hamlに遷移すること" do
        get :new
        expect(response).to render_template :new
      end
    end
  end
end