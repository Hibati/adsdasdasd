class AddlogicsController < ApplicationController
  before_action :set_addlogic, only: [:show, :edit, :update, :destroy]

  # GET /diots
  # GET /diots.json
  def index
    @addlogics = Addlogic.all
  end

  # GET /diots/1
  # GET /diots/1.json
  def show
  end

  # GET /diots/new
  def new
    @addlogic = Addlogic.new
    @selection_1 = '<', '<=', '=', '>', '>='
    @selection_2 = "24", "25", "26", "27", "28", "29", "30" 
    @selection_3 = 'Open', 'Close'
  end

  # GET /diots/1/edit
  def edit
  end

  # POST /diots
  # POST /diots.json
  def create
    @addlogic = Addlogic.new(addlogic_params)

    respond_to do |format|
      if @addlogic.save
        format.html { redirect_to @addlogic, notice: 'Logic was successfully created.' }
        format.json { render :show, status: :created, location: @addlogic }
      else
        format.html { render :new }
        format.json { render json: @addlogic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diots/1
  # PATCH/PUT /diots/1.json
  def update
    respond_to do |format|
      if @addlogic.update(diot_params)
        format.html { redirect_to @addlogic, notice: 'Diot was successfully updated.' }
        format.json { render :show, status: :ok, location: @addlogic }
      else
        format.html { render :edit }
        format.json { render json: @addlogic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diots/1
  # DELETE /diots/1.json
  def destroy
    @addlogic.destroy
    respond_to do |format|
      format.html { redirect_to diots_url, notice: 'Diot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_addlogic
      @addlogic = Addlogic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def addlogic_params
      params.require(:addlogic).permit(:When_this_stuff_happens, :Event_1, :Evnet_2, :Then_do_these_things_1st, :Event_3, :Then_do_these_things_2st, :Event_4, :Then_do_these_things_3st, :Event_5, :Then_do_these_things_4st, :Event_6)
    end
    

end
