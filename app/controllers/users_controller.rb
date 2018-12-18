class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy, :confirmation]

# GET /users
# GET /users.json
def index
  @users = User.search(params[:term])
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

  if @user.request_id.nil? == true
    #flash[:notice] = "Veuillez préciser le type de la requête."
  end

    if @user.save
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
        flash[:notice] = "Erreur, id de requête inconnu"
      end
    else
      redirect_to new_user_path
  end
end


# PATCH/PUT /users/1
# PATCH/PUT /users/1.json
def update
      if @user.update(user_params)
        # In case of Request #3 (unsubscriptions)
        # redirect_to confirmation for this request.
      redirect_to limit_right_confirmation_requests_path
    else
      redirect_to limit_right_requests_path(user_id: @user.id),
                        notice: 'Erreur'
  end
end

# DELETE /users/1
# DELETE /users/1.json
def destroy
  @user.destroy
  respond_to do |format|
    format.html { redirect_to users_url, notice: 'La requête a bien été supprimée.' }
    format.json { head :no_content }
  end
end


private
# Use callbacks to share common setup or constraints between actions.
def set_user
  @user = User.find(params[:id])
end

# Never trust parameters from the scary internet, only allow the white list through.
def user_params
  params.require(:user).permit( :name, :surname, :email, :phone, :address,
                        :city, :zipcode, :request_id,
                        modifications_attributes: [ :name, :surname, :string,
                          :email, :phone, :address, :city, :zipcode ],
                        choices_attributes: [:id, :completed] )
end
end
