class RequestsController < ApplicationController
  before_action :set_request_and_user
  skip_before_action :login_required,
    only: [:access_right, :edit_right, :limit_right_confirmation, :delete_right, :limit_right]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1
  # GET /requests/1.json

  def access_right
  end

  def edit_right
  end

  def limit_right
    @unsubscription = Unsubscription.new
  end

  def limit_right_confirmation
    # MAIL THE DPO
    OfficerMailer.with(user: @user).limit_right.deliver

    # MAIL THE USER
    UserMailer.with(user: @user).limit_right.deliver
  end

  def delete_right
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        flash[:success] = "Ce type de demande a bien été créé!"
        format.html { redirect_to requests_path }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        flash[:success] = "Ce type de demande a bien été modifié!"
        format.html { redirect_to @request }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      flash[:success] = 'Ce type de demande a bien été supprimé.'
      format.html { redirect_to requests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_and_user
      @user = User.find(params[:user]) if params[:user]
      @user = User.find(params[:user_id]) if params[:user_id]
      @request = Request.find(params[:id]) if params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:title)
    end
end
