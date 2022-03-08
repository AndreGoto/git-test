class EventService
  attr_reader :errors, :event

  def self.call(event_params, issue_params)
    service = self.new(event_params, issue_params)
    service.call
    return service
  end

  def initialize(event_params, issue_params)
    @event_params = event_params
    @issue_params = issue_params
    @errors = []
  end

  def call
    begin
      ActiveRecord::Base.transaction do
        find_or_create_issue
        create_event
      end
    rescue StandardError => error
      @errors << error
    end
  end

  private

  attr_reader :issue

  def find_or_create_issue
    @issue = Issue.where(
      issue_id: @issue_params[:number], repository_url: @issue_params[:repository_url]
    ).first_or_create
  end

  def create_event
    @event = Event.create(issue: @issue, action: @event_params[:action], payload: @event_params[:payload_body])
  end
end
