module Api
  module V1
    class UsersController < ApiController

      respond_to :json
      # the api requests do not need login
      #skip_before_action :login_required

      def index
        respond_with User.all
      end

      def cemetary
        unfiltered_users = User.search(params[:term])
        respond_with User.where('"archived" = ?', true)
      end
    end
  end
end
