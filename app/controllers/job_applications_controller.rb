class JobApplicationsController < ApplicationController
  before_filter :permission, :except => :create
  
  # GET /job_applications
  # GET /job_applications.xml
  def index
    @job_applications = JobApplication.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @job_applications }
    end
  end

  # GET /job_applications/1
  # GET /job_applications/1.xml
  def show
    @job_application = JobApplication.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job_application }
    end
  end

  # GET /job_applications/new
  # GET /job_applications/new.xml
  def new
    @job_application = JobApplication.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job_application }
    end
  end

  # GET /job_applications/1/edit
  def edit
    @job_application = JobApplication.find(params[:id])
  end

  # POST /job_applications
  # POST /job_applications.xml
  def create
    @job_application = JobApplication.new(params[:job_application])

    respond_to do |format|
      if @job_application.save
        JobApplicationMailer.deliver_submit(@job_application)
        flash[:notice] = 'JobApplication was successfully created.'
        format.html { redirect_to(@job_application) }
        format.js do 
          responds_to_parent do
            render :js => "$('#modal').html('" + @template.escape_javascript(render_to_string( :partial => "success")) + "');$('#modal').jqmShow();$('#new_job_application')[0].reset();" 
          end
        end
        format.xml  { render :xml => @job_application, :status => :created, :location => @job_application }
      else
        format.html { render :action => "new" }
        format.js do
          responds_to_parent do
            render :js => "$('#new_job_application').replaceWith('" + @template.escape_javascript(render_to_string(:partial => 'block_show', :object => @job_application)) + "');" 
          end
        end
        format.xml  { render :xml => @job_application.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /job_applications/1
  # PUT /job_applications/1.xml
  def update
    @job_application = JobApplication.find(params[:id])

    respond_to do |format|
      if @job_application.update_attributes(params[:job_application])
        flash[:notice] = 'JobApplication was successfully updated.'
        format.html { redirect_to(@job_application) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job_application.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /job_applications/1
  # DELETE /job_applications/1.xml
  def destroy
    @job_application = JobApplication.find(params[:id])
    @job_application.destroy

    respond_to do |format|
      format.html { redirect_to(job_applications_url) }
      format.xml  { head :ok }
    end
  end
end
