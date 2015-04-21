class FillingTasksController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @filling_task = @user.filling_tasks.build
  end

  def create
    @user = User.find(params[:user_id])
    create_params = params.require(:filling_task).permit(:desc, :year, :month, :mday)
    @filling_task = @user.filling_tasks.build(create_params)
    if @filling_task.save
      return render :partial => 'filling_tasks/li', :locals => {:filling_task => @filling_task}
    else
      return render :text => '500', :status => 500
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @filling_task = @user.filling_tasks.find(params[:id])
    @filling_task.destroy
    render :json => {:status => "ok"}
  end
end