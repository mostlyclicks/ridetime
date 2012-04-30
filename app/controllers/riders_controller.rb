
class RidersController < ApplicationController
  
  #attr_accessor :riders_time
  # GET /riders
  # GET /riders.json
  def index
    @riders = Rider.all.find.sort_by(&:race_number)
    
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @riders }
    end
  end
  
  def leader_board
    @riders_pre = Rider.all
    
    @riders_pre.each do |roc|
      if roc.start_time? && roc.finish_time?
        @riders << roc
      end
    end
    
    
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @riders }
    end
  end
  
  def cleartime
    @rider = Rider.find(params[:id])
    #@rider.start_time = Time.now
    #@rider.finish_time = Time.now + 1
    respond_to do |format|
       if @rider.update_attributes(params[:rider])
         format.html { redirect_to riders_path, notice: 'Rider was successfully updated.' }
         format.json { head :no_content }
       else
         format.html { render action: "edit" }
         format.json { render json: @rider.errors, status: :unprocessable_entity }
       end
     end
    
    
  end
  
  #def ridetime
  #   @rider = Rider.find(params[:id])
  #   time_diff_components[:seconds]
  #   #@rider.rider_time
  #end
  
  def rider_start
   @rider = Rider.find(params[:id])
   @rider.start_time = Time.now
   
   
   respond_to do |format|
     if @rider.update_attributes(params[:rider])
       format.html { redirect_to riders_path, notice: 'Rider was successfully updated.' }
       format.json { head :no_content }
     else
       format.html { render action: "edit" }
       format.json { render json: @rider.errors, status: :unprocessable_entity }
     end
   end
  end
  
  def rider_finish
    @rider = Rider.find(params[:id])
    @rider.finish_time = Time.now
    
    respond_to do |format|
       if @rider.update_attributes(params[:rider])
         format.html { redirect_to riders_path, notice: 'Rider was successfully updated.' }
         format.json { head :no_content }
       else
         format.html { render action: "edit" }
         format.json { render json: @rider.errors, status: :unprocessable_entity }
       end
     end
  end
  


  # GET /riders/1
  # GET /riders/1.json
  def show
    @rider = Rider.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rider }
    end
  end

  # GET /riders/new
  # GET /riders/new.json
  def new
    @rider = Rider.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rider }
    end
  end

  # GET /riders/1/edit
  def edit
    @rider = Rider.find(params[:id])
  end

  # POST /riders
  # POST /riders.json
  def create
    @rider = Rider.new(params[:rider])

    respond_to do |format|
      if @rider.save
        format.html { redirect_to @rider, notice: 'Rider was successfully created.' }
        format.json { render json: @rider, status: :created, location: @rider }
      else
        format.html { render action: "new" }
        format.json { render json: @rider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /riders/1
  # PUT /riders/1.json
  def update
    @rider = Rider.find(params[:id])

    respond_to do |format|
      if @rider.update_attributes(params[:rider])
        format.html { redirect_to @rider, notice: 'Rider was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /riders/1
  # DELETE /riders/1.json
  def destroy
    @rider = Rider.find(params[:id])
    @rider.destroy

    respond_to do |format|
      format.html { redirect_to riders_url }
      format.json { head :no_content }
    end
  end
end
