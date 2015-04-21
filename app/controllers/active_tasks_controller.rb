class ActiveTasksController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @active_task = @user.active_tasks.build
  end

  def create
    @user = User.find(params[:user_id])
    create_params = params.require(:active_task).permit(:desc, :year, :month, :mday)
    @active_task = @user.active_tasks.build(create_params)
    if @active_task.save
      return render :partial => 'active_tasks/li', :locals => {:active_task => @active_task}
    else
      return render :text => '500', :status => 500
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @active_task = @user.active_tasks.find(params[:id])
    @active_task.destroy
    render :json => {:status => "ok"}
  end
end