class TaskSubmitsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @task_submit = @user.task_submits.build
  end

  def create
    @user = User.find(params[:user_id])
    create_params = params.require(:task_submit).permit(:desc, :year, :month, :mday)
    @task_submit = @user.task_submits.build(create_params)
    year = params[:task_submit][:year]
    month = params[:task_submit][:month]
    mday = params[:task_submit][:mday]
    if @task_submit.save
      return redirect_to "/users/#{@user.id}?year=#{year}&month=#{month}&mday=#{mday}"
    end
    redirect_to "/users/#{@user.id}/task_submits/new"
  end

  def destroy
    @user = User.find(params[:user_id])
    @task_submit = @user.task_submits.find(params[:id])
    @task_submit.destroy
    year = params[:year]
    month = params[:month]
    mday = params[:mday]
    render :json => {:status => "ok"}
  end
end