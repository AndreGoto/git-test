class IssuesController < ApplicationController
  def events
    @events = Event.where(issue: params[:id])
    render json: { events: @events }, status: :ok
  end
end
