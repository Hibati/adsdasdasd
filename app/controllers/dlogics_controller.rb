class DlogicsController < ApplicationController
  before_action :set_dlogic, only: [:show, :drive_logics, :edit, :update, :destroy]

  require 'json'
  require 'open-uri'
  require 'job.rb'
  
  # GET /dlogics
  # GET /dlogics.json
  def index
    @dlogics = Dlogic.all
  end

  # GET /dlogics/1
  # GET /dlogics/1.json
  def show
  end
  
  def drive_logics
    
    when_this_stuff_happens = Dlogic.find(params[:id]).When_this_stuff_happens
    event1 = Dlogic.find(params[:id]).Event_1
    event2 = Dlogic.find(params[:id]).Event_2 #
    then_do_these_things_1st = Dlogic.find(params[:id]).Then_do_these_things_1st #
    event3 = Dlogic.find(params[:id]).Event_3 # 
    then_do_these_things_2st = Dlogic.find(params[:id]).Then_do_these_things_2st #
    event4 = Dlogic.find(params[:id]).Event_4 #
    then_do_these_things_3st = Dlogic.find(params[:id]).Then_do_these_things_3st #
    event5 = Dlogic.find(params[:id]).Event_5 #
    then_do_these_things_4st = Dlogic.find(params[:id]).Then_do_these_things_4st #
    event6 = Dlogic.find(params[:id]).Event_6 #
    
      
    if when_this_stuff_happens == 'Temperature' && then_do_these_things_1st == "Led"
      puts "=================  Background begin ============================"
       Thread.new do
         ob = OpeningJob.new
         ob.perform(event1, event2, event3)
       end
    end

  end



  # GET /dlogics/new
  def new
    @dlogic = Dlogic.new
    @selection_1 = '<', '<=', '=', '>', '>='
    @selection_2 = '24', '25', '26', '27'
    @selection_3 = 'Open', 'Close'
  end

  # GET /dlogics/1/edit
  def edit
  end

  # POST /dlogics
  # POST /dlogics.json
  def create
    @dlogic = Dlogic.new(dlogic_params)

    respond_to do |format|
      if @dlogic.save
        format.html { redirect_to @dlogic, notice: 'Dlogic was successfully created.' }
        format.json { render :show, status: :created, location: @dlogic }
      else
        format.html { render :new }
        format.json { render json: @dlogic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dlogics/1
  # PATCH/PUT /dlogics/1.json
  def update
    respond_to do |format|
      if @dlogic.update(dlogic_params)
        format.html { redirect_to @dlogic, notice: 'Dlogic was successfully updated.' }
        format.json { render :show, status: :ok, location: @dlogic }
      else
        format.html { render :edit }
        format.json { render json: @dlogic.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # DELETE /dlogics/1
  # DELETE /dlogics/1.json
  def destroy
    @dlogic.destroy
    respond_to do |format|
      format.html { redirect_to dlogics_url, notice: 'Dlogic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dlogic
      @dlogic = Dlogic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dlogic_params
      params.require(:dlogic).permit(:When_this_stuff_happens, :Event_1, :Event_2, :Then_do_these_things_1st, :Event_3, :Then_do_these_things_2st, :Event_4, :Then_do_these_things_3st, :Event_5, :Then_do_these_things_4st, :Event_6)
    end
end
