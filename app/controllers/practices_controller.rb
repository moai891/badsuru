class PracticesController < ApplicationController
  before_action :authenticate_user!
  def new
    @practice = Practice.new
    @practice.users << current_user

  # もしもpathがグループからのリクエストだったら
  #  @group = Group.find(params[:id])
  #   unless @group.blank?
  #     ## グループ画面から作成した場合、グループのユーザーを代入させる
  #     @practice << @group.users
  #   else
  #     @group = Group.new(name:"なし")
  #   end
  end

  def create
    @practice = Practice.new(practice_params)
    if @practice.save
      redirect_to root_path, notice: "練習を作成しました"
    else
      flash.now[:alert] = "登録エラー。再度登録をしてください"
      render :new
    end
  end

  private
    def practice_params
      params.require(:practice).permit(:name, :group_name, :date, :start_time, :end_time, :prefecture_code, :city, :place, :detail, :visitor_pay, :shuttle_id, :member_limit, { user_ids: [] } ).merge( manager_id: current_user.id )
    end

    # def group_params
    #   params.require(:group).permit(:name, :detail, :group_avatar, { user_ids: [] } )
    # end
end
