class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :validation_error

  def validation_error(error)
    render json: ErrorSerializer.new(error).bad_request_object, status: :bad_request
  end

  def error_message(errors)
    errors.full_messages.join(', ')
  end
end
