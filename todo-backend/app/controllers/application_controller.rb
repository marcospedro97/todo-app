class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def invalid_record
    render json: { error: 'Invalid Record' }, status: :bad_request
  end

  def record_not_found
    render json: { error: 'Record Not Found' }, status: :not_found
  end
end
