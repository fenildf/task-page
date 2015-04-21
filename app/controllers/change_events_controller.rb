class ChangeEventsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @change_event = @user.change_events.build
  end

  def create
    @user = User.find(params[:user_id])
    create_params = params.require(:change_event).permit(:desc, :year, :month, :mday)
    @change_event = @user.change_events.build(create_params)
    if @change_event.save
      return render :partial => 'change_events/li', :locals => {:change_event => @change_event}
    else
      return render :text => '500', :status => 500
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @change_event = @user.change_events.find(params[:id])
    @change_event.destroy
    render :json => {:status => "ok"}
  end
end