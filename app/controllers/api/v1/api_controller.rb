module Api
  module V1
    class ApiController < ActionController::Base
      protect_from_forgery with: :null_session

      before_action :set_headers, :authenticate_request

      def authenticate_request
        @current_officer = AuthorizeApiRequest.call(request.headers).result
        render json: { error: 'Not Authorized' }, status: 401 unless @current_officer
      end

      private

      def set_headers
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Expose-Headers'] = 'ETag'
        headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
        headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match'
        headers['Access-Control-Max-Age'] = '86400'
      end
    end
  end
end
