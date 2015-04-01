class RecentTasksController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @recent_task = @user.recent_tasks.build
  end

  def create
    @user = User.find(params[:user_id])
    create_params = params.require(:recent_task).permit(:desc, :year, :month, :mday)
    @recent_task = @user.recent_tasks.build(create_params)
    year = params[:recent_task][:year]
    month = params[:recent_task][:month]
    mday = params[:recent_task][:mday]
    if @recent_task.save
      return redirect_to "/users/#{@user.id}?year=#{year}&month=#{month}&mday=#{mday}"
    end
    redirect_to "/users/#{@user.id}/recent_tasks/new"
  end

  def destroy
    @user = User.find(params[:user_id])
    @recent_task = @user.recent_tasks.find(params[:id])
    @recent_task.destroy
    year = params[:year]
    month = params[:month]
    mday = params[:mday]
    render :json => {:status => "ok"}
  end
end