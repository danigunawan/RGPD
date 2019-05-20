class UnsubscriptionsController < ApplicationController
  skip_before_action :login_required, only: [:new, :create, :update]
  before_action :set_unsubscription, only: [:show, :edit, :update, :destroy ]

  # GET /unsubscriptions
  # GET /unsubscriptions.json
  def index
    @unsubscriptions = Unsubscription.all
  end

  # GET /unsubscriptions/1
  # GET /unsubscriptions/1.json
  def show
  end

  # GET /unsubscriptions/new
  def new
    @unsubscription = Unsubscription.new
  end

  # GET /unsubscriptions/1/edit
  def edit
  end

  # POST /unsubscriptions
  # POST /unsubscriptions.json
  def create
    @unsubscription = Unsubscription.new(unsubscription_params)
    is_specific = @unsubscription.reason_specific
    respond_to do |format|
      if @unsubscription.save
        if is_specific
          @unsubscription.choices.last.specific = true
          @unsubscription.save
          format.html { redirect_to limit_right_confirmation_requests_path(user_id: params[:user_id]) }
      else
        flash[:success] = "Le traitement a bien été créé!"
        format.html { redirect_to @unsubscription }
        format.json { render :show, status: :created, location: @unsubscription }
      end
      else
        format.html { render :new }
        format.json { render json: @unsubscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unsubscriptions/1
  # PATCH/PUT /unsubscriptions/1.json
  def update
    respond_to do |format|
      if @unsubscription.update(unsubscription_params)
        flash[:success] = "Le traitement a bien été modifié!"
        format.html { redirect_to @unsubscription }
        format.json { render :show, status: :ok, location: @unsubscription }
      else
        format.html { render :edit }
        format.json { render json: @unsubscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unsubscriptions/1
  # DELETE /unsubscriptions/1.json
  def destroy
    @unsubscription.destroy
    respond_to do |format|
      flash[:success] = "Le traitement a bien été supprimé!"
      format.html { redirect_to unsubscriptions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unsubscription
      @unsubscription = Unsubscription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unsubscription_params
      params.require(:unsubscription).permit(:kind, :reason_specific,
                    choices_attributes: [:id, :completed, :user_id, :specific])
    end
end
