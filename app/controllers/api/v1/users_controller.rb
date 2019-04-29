module Api
  module V1
    class UsersController < ApiController

      before_action :set_user, only: [:archive, :destroy]
      respond_to :json
      # the api requests do not need login
      #skip_before_action :login_required

      def index
        respond_with User.where(archived: nil).order('updated_at DESC')
      end
      def cemetary
        respond_with User.where(archived: true).order('updated_at DESC')
      end

      def archive
        if @user.archived == true
          @user.archived = nil
        else
          @user.archived = true
        end
        if @user.save
            render json: { success: "Saved." }
        else
          render json: { error: "Unable to save this user. Is the user id correct?" }
        end
      end

      def destroy
        @user.destroy
      end

      private

      def set_user
        @user = User.find(params['id'])
      end
    end
  end
end
