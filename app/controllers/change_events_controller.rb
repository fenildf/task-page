class ChangeEventsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @change_event = @user.change_events.build
  end

  def create
    @user = User.find(params[:user_id])
    create_params = params.require(:change_event).permit(:desc, :year, :month, :mday)
    @change_event = @user.change_events.build(create_params)
    year = params[:change_event][:year]
    month = params[:change_event][:month]
    mday = params[:change_event][:mday]
    if @change_event.save
      return redirect_to "/users/#{@user.id}?year=#{year}&month=#{month}&mday=#{mday}"
    end
    redirect_to "/users/#{@user.id}/change_events/new"
  end

  def destroy
    @user = User.find(params[:user_id])
    @change_event = @user.change_events.find(params[:id])
    @change_event.destroy
    year = params[:year]
    month = params[:month]
    mday = params[:mday]
    render :json => {:status => "ok"}
  end
end