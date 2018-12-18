class OfficersController < ApplicationController
  before_action :set_officer, only: [:show, :edit, :update, :destroy]
  skip_before_action :login_required, only: [:new, :create]

  # GET /officers
  # GET /officers.json
  def index
    @officers = Officer.all
  end

  # GET /officers/1
  # GET /officers/1.json
  def show
  end

  # GET /officers/new
  def new
    @officer = Officer.new
  end

  # GET /officers/1/edit
  def edit
  end

  # POST /officers
  # POST /officers.json
  def create
    @officer = Officer.new(officer_params)
      if Token.find_by_secret(params[:code]) && @officer.save
        session[:officer_id] = @officer.id
        Token.find_by_secret(params[:code]).destroy
       redirect_to users_path
       #Mail to confirm account creation
      else
        if ! Token.find_by_secret(params[:code])
          flash[:notice] = "Mauvais code."
        else
          flash[:notice] = "Erreur à l'enregistrement."
        end
        redirect_to new_officer_path
      end
  end

  # PATCH/PUT /officers/1
  # PATCH/PUT /officers/1.json
  def update
    respond_to do |format|
      if @officer.update(officer_params)
        format.html { redirect_to @officer, notice: 'Officer was successfully updated.' }
        format.json { render :show, status: :ok, location: @officer }
      else
        format.html { render :edit }
        format.json { render json: @officer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /officers/1
  # DELETE /officers/1.json
  def destroy
    @officer.destroy
    respond_to do |format|
      format.html { redirect_to officers_url, notice: 'Officer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_officer
      @officer = Officer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def officer_params
      params.require(:officer).permit(:firstname, :lastname, :email, :password, :password_confirmation)
    end
end
