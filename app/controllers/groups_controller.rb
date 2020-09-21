class GroupsController < ApplicationController
  before_action :authenticate_user!
  # def index
  #   # cunnrent_userを含むgroup==current_user.idを含むgroupを取得する
  #   # @my_groups = Group.where('user_id like ?','current_user.id')
  #   @my_groups = current_user.groups

  # end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: "グループ登録が完了しました"
    else
      flash.now[:alert] = "登録エラー。再度登録をしてください"
      render :new
    end
    
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to root_path, notice: "グループを更新しました"
    else
      flash.now[:alert] = "更新エラー"
      render :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :detail, :group_avatar, { user_ids: [] } )
  end
end
