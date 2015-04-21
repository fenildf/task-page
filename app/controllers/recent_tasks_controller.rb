class RecentTasksController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @recent_task = @user.recent_tasks.build
  end

  def create
    @user = User.find(params[:user_id])
    create_params = params.require(:recent_task).permit(:desc, :year, :month, :mday)
    @recent_task = @user.recent_tasks.build(create_params)
    if @recent_task.save
      return render :partial => 'recent_tasks/li', :locals => {:recent_task => @recent_task}
    else
      return render :text => '500', :status => 500
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @recent_task = @user.recent_tasks.find(params[:id])
    @recent_task.destroy
    render :json => {:status => "ok"}
  end
end