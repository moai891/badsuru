class HomeController < ApplicationController
  def index
    @datas = Profile.all

    if user_signed_in?
      @my_groups = current_user.groups
    else
      @groups = Group.first(4)
    end
    
  end
end
