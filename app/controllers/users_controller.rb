class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :archive, :confirmation]
  skip_before_action :login_required, only: [:new, :create, :update]
  # GET /users
  # GET /users.json
  def index
    unfiltered_users = User.search(params[:term])
    @users = unfiltered_users.select do | user | user.archived == nil end
    end

    # GET /users/1
    # GET /users/1.json
    def show
    end

    # GET /users/new
    def new
      @user = User.new
    end

    # GET /users/1/edit
    def edit
    end

    # POST /users
    # POST /users.json
    def create
      @user = User.new(user_params)
      #if @user.request_id.nil? == true
      #  flash.now[:danger] = "Veuillez préciser le type de la requête."
      if verify_recaptcha(model: @user) && @user.save
        #        UserMailer.with(user: @user).welcome_email.deliver_later
        case @user.request_id
        when 1
          redirect_to access_right_requests_path
          #MAIL THE DPO
          #MAIL THE USER
        when 2
          redirect_to new_user_modifications_path(@user)
          #mail sent through modifications_controller
        when 3
          redirect_to  limit_right_requests_path(user_id: @user.id)
          #Mail sent through requests_controller
        when 4
          redirect_to delete_right_requests_path
          #MAIL THE DPO
          #MAIL THE USER
        else
          flash[:danger] = "Veuillez préciser le type de la requête."
          redirect_to new_user_path
        end
      else
        if !verify_recaptcha(model: @user)
          @user.errors.full_messages.each do | error |
            puts error
          end
          flash[:danger]= "Captcha invalide!"
        end
        redirect_to new_user_path
      end
    end



    # PATCH/PUT /users/1
    # PATCH/PUT /users/1.json
    def update
      if any_unsub? && @user.update(user_updatable_params)
        # In case of Request #3 (unsubscriptions)
        # redirect_to confirmation for this request.
        redirect_to limit_right_confirmation_requests_path
      else
        #flash[:danger] = "Erreur."
        if !any_unsub?
          flash[:danger]="Vous devez sélectionner au moins un choix"
        end
          redirect_to limit_right_requests_path(user_id: @user.id)
      end
    end

    # DELETE /users/1
    # DELETE /users/1.json
    def cemetary
      unfiltered_users = User.search(params[:term])
      @users = unfiltered_users.select do | user | user.archived == true end
      end

      def archive
        if @user.archived == true
          @user.archived = nil
          flash[:success] = "La requête a bien été restaurée"
        else
          flash[:success] = "La requête a bien été archivée."
          @user.archived = true
        end
        if @user.save
          respond_to do |format|
            format.html { redirect_to users_path }
            format.json { head :no_content }
          end
        else
          flash[:danger] = "Impossible d'archiver cette demande. Erreur d'enregistrement."
          redirect_to users_path
        end
      end


      private
#validity check for unsubscription submition
      def any_unsub?
        chosen  = false
        choices = params[:user][:choices_attributes]
        choices.each do |unsub, v|
          if v['completed'] == "1"
           chosen = true
          end
        end
        chosen
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit( :name, :surname, :email, :phone, :address,
          :city, :zipcode, :request_id, :archived,
          modifications_attributes: [ :name, :surname, :string,
            :email, :phone, :address, :city, :zipcode ],
            choices_attributes: [:id, :completed] )
          end

          def user_updatable_params
            params.require(:user).permit(:unsubscription, unsubscriptions_attributes: [:user_id, :specific, :id, :kind, :reason_specific ], modifications_attributes: [ :name, :surname, :string,
              :email, :phone, :address, :city, :zipcode ], choices_attributes: [:id, :completed, :unsubscriptions_id] )
            end
          end
