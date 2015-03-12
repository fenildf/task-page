class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    count = 0
    params["users"].each do |user|
      user = User.new(:email => user[:email], :name => user[:name])
      count+=1 if user.save
    end
    flash[:success] = "创建了 #{count} 个人员"
    render :json => {:count => count}
  end

  def destroy
    user = User.find(params[:id])

    user.destroy
    render :json => {:status => "ok"}
  end

  def show
    @user = User.find(params[:id])
    @year  = params[:year]
    @month = params[:month]
    @mday  = params[:mday]
    if @year.blank?
      @current_day = Time.now.localtime("+08:00").beginning_of_day
    else
      @current_day = Time.new(@year, @month, @mday, 0, 0, 0, "+08:00")
    end
  end
end
