class ModificationsController < ApplicationController
  before_action :set_modification, only: [:show, :edit, :update, :destroy]

  # GET /modifications
  # GET /modifications.json
  def index
    @modifications = Modification.all
  end

  # GET /modifications/1
  # GET /modifications/1.json
  def show
  end

  # GET /modifications/new
  def new
    puts @user
    @modification = Modification.new
  end

  # GET /modifications/1/edit
  def edit
  end

  # POST /modifications
  # POST /modifications.json
  def create
    @user = User.find(params[:user_id])
    @modification = Modification.new(modification_params)
    @user.modification = @modification
      if @modification.save
        redirect_to edit_right_requests_path
        #MAIL THE DPO
        #MAIL THE User
      else
        redirect_to new_user_modifications_path
      end
  end

  # PATCH/PUT /modifications/1
  # PATCH/PUT /modifications/1.json
  def update
    respond_to do |format|
      if @modification.update(modification_params)
        format.html { redirect_to @modification, notice: 'Modification was successfully updated.' }
        format.json { render :show, status: :ok, location: @modification }
      else
        format.html { render :edit }
        format.json { render json: @modification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modifications/1
  # DELETE /modifications/1.json
  def destroy
    @modification.destroy
    respond_to do |format|
      format.html { redirect_to modifications_url, notice: 'Modification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modification
      @modification = Modification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def modification_params
      params.require(:modification).permit(:name, :surname, :string, :email, :phone, :address, :city, :zipcode)
    end
end
