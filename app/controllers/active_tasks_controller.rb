class ActiveTasksController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @active_task = @user.active_tasks.build
  end

  def create
    @user = User.find(params[:user_id])
    create_params = params.require(:active_task).permit(:desc, :year, :month, :mday)
    @active_task = @user.active_tasks.build(create_params)
    year = params[:active_task][:year]
    month = params[:active_task][:month]
    mday = params[:active_task][:mday]
    if @active_task.save
      return redirect_to "/users/#{@user.id}?year=#{year}&month=#{month}&mday=#{mday}"
    end
    redirect_to "/users/#{@user.id}/active_tasks/new"
  end

  def destroy
    @user = User.find(params[:user_id])
    @active_task = @user.active_tasks.find(params[:id])
    @active_task.destroy
    year = params[:year]
    month = params[:month]
    mday = params[:mday]
    render :json => {:status => "ok"}
  end
end