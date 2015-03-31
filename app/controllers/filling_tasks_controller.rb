class FillingTasksController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @filling_task = @user.filling_tasks.build
  end

  def create
    @user = User.find(params[:user_id])
    create_params = params.require(:filling_task).permit(:desc, :year, :month, :mday)
    @filling_task = @user.filling_tasks.build(create_params)
    year = params[:filling_task][:year]
    month = params[:filling_task][:month]
    mday = params[:filling_task][:mday]
    if @filling_task.save
      return redirect_to "/users/#{@user.id}?year=#{year}&month=#{month}&mday=#{mday}"
    end
    redirect_to "/users/#{@user.id}/filling_tasks/new"
  end
end