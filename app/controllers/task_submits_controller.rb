class TaskSubmitsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @task_submit = @user.task_submits.build
  end

  def create
    @user = User.find(params[:user_id])
    create_params = params.require(:task_submit).permit(:desc, :year, :month, :mday)
    @task_submit = @user.task_submits.build(create_params)
    if @task_submit.save
      return render :partial => 'task_submits/li', :locals => {:task_submit => @task_submit}
    else
      return render :text => '500', :status => 500
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @task_submit = @user.task_submits.find(params[:id])
    @task_submit.destroy
    render :json => {:status => "ok"}
  end
end