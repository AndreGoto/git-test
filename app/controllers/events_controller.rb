class EventsController < ApplicationController
  def create
    verify_signature
    result = EventService.call(event_params, issue_params)

    if result.errors.empty?
      render json: result.event, status: :created
    else
      render json: { errors: result.errors }, status: :unprocessable_entity
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:number, :repository_url)
  end

  def event_params
    {
      action: params.require(:action),
      payload_body: params.require(:issue)
    }
  end
end
