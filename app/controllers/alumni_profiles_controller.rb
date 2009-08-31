class AlumniProfilesController < ApplicationController
  # GET /alumni_profiles
  # GET /alumni_profiles.xml
  def index
    @alumni_profiles = AlumniProfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @alumni_profiles }
    end
  end

  # GET /alumni_profiles/1
  # GET /alumni_profiles/1.xml
  def show
    @alumni_profile = AlumniProfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @alumni_profile }
    end
  end

  # GET /alumni_profiles/new
  # GET /alumni_profiles/new.xml
  def new
    @alumni_profile = AlumniProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @alumni_profile }
    end
  end

  # GET /alumni_profiles/1/edit
  def edit
    @alumni_profile = AlumniProfile.find(params[:id])
  end

  # POST /alumni_profiles
  # POST /alumni_profiles.xml
  def create
    @alumni_profile = AlumniProfile.new(params[:alumni_profile])

    respond_to do |format|
      if @alumni_profile.save
        flash[:notice] = 'AlumniProfile was successfully created.'
        format.html { redirect_to(@alumni_profile) }
        format.xml  { render :xml => @alumni_profile, :status => :created, :location => @alumni_profile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @alumni_profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /alumni_profiles/1
  # PUT /alumni_profiles/1.xml
  def update
    @alumni_profile = AlumniProfile.find(params[:id])

    respond_to do |format|
      if @alumni_profile.update_attributes(params[:alumni_profile])
        flash[:notice] = 'AlumniProfile was successfully updated.'
        format.html { redirect_to(@alumni_profile) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @alumni_profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /alumni_profiles/1
  # DELETE /alumni_profiles/1.xml
  def destroy
    @alumni_profile = AlumniProfile.find(params[:id])
    @alumni_profile.destroy

    respond_to do |format|
      format.html { redirect_to(alumni_profiles_url) }
      format.xml  { head :ok }
    end
  end
end
