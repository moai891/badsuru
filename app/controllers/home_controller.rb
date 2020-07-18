class HomeController < ApplicationController
  def index
    @datas = Profile.all
  end
end
