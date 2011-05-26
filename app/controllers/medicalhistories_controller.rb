class MedicalhistoriesController < ApplicationController
  def index
    if normal_user?
      @medicalhistories = []
      @record = Medicalhistory.where("user_id = ?", current_user.id).first
      @medicalhistories<<@record
    end
    if location_admin?
      @medicalhistories = Medicalhistory.find(:all)
    end
    if super_admin?
      @medicalhistories = []
    end
  end


  def show
    if normal_user? 
      print "came here"
      @medicalhistory = Medicalhistory.where("user_id = ?", current_user.id).first
    elsif location_admin?
      print "came here 1" + current_user.username.to_s
      @medicalhistory = Medicalhistory.find(params[:id])
    end
#@medicalhistory = Medicalhistory.where("user_id = ?", current_user.id).first
      respond_to do |format| 
        format.html # show.html.erb 
        format.pdf {
        html = render_to_string(:template => "medicalhistories/show.html.erb")
        kit = PDFKit.new(html)
        kit.stylesheets << "#{Rails.root}/public/stylesheets/pdf.css"
        send_data(kit.to_pdf, :filename => "#{@medicalhistory.fname}.pdf",
          :type => 'application/pdf', :disposition => 'attachment')        
        return
        }
      end
  end

  def new
    session[:medicalhistory_params] = {}
    @medicalhistory = Medicalhistory.new(session[:medicalhistory_params])	
    #@medicalhistory.current_step = session[:form_step]
    @medicalhistory.current_step = @medicalhistory.steps.first
    @medicalhistory.user = User.new unless !@medicalhistory.current_step.eql?("about")
  end

  def check_boxes(alloptions) 
    checked_conditions = []
    if alloptions != nil
      alloptions.each do |condition|
        checked_conditions.push(condition) unless condition.length <= 1
      end
      checked_conditions = checked_conditions.join(",")
    end
  end

  def create
    session[:medicalhistory_params].deep_merge!(params[:medicalhistory]) if params[:medicalhistory]
    @medicalhistory= Medicalhistory.new(session[:medicalhistory_params])
    @medicalhistory.current_step = session[:form_step]
   print "Step: "+  @medicalhistory.current_step.to_s
    if (@medicalhistory.user.valid? && @medicalhistory.valid?) 
  if params[:back_button]
        @medicalhistory.previous_step
      elsif @medicalhistory.last_step?
        @medicalhistory.medical_conditions = check_boxes(@medicalhistory.medical_conditions)
        @medicalhistory.women = check_boxes(@medicalhistory.women) 
        @medicalhistory.allergic = check_boxes(@medicalhistory.allergic)
        @medicalhistory.user.firstname = @medicalhistory.fname
        @medicalhistory.user.lastname = @medicalhistory.lastname
        if @medicalhistory.all_valid?
          @medicalhistory.save 
          apptmt = Appointment.new
#apptmt.day = Dayavailable.find(@medicalhistory.appointment).name
          apptmt.day = Date::DAYNAMES[@medicalhistory.aptmt_date.to_date.wday]
          datetime_local = "#{@medicalhistory.aptmt_date} #{@medicalhistory.aptmt_time}"
          apptmt.time = Time.parse(datetime_local)
          apptmt.user_id = @medicalhistory.user.id
          apptmt.location_id = @medicalhistory.location_id
          apptmt.save
        end
      else
        @medicalhistory.next_step
      end
      session[:form_step] = @medicalhistory.current_step
    end
    if @medicalhistory.new_record?
      render "new"
    else
      session[:form_step] = session[:medicalhistory_params] = nil
      flash[:notice] = "New Patient Registration Complete.  Username: #{@medicalhistory.user.username}"
      redirect_to @medicalhistory
    end
  end

  def edit
    @medicalhistory = Medicalhistory.where("user_id = ?", current_user.id).first
    @medicalhistory.medical_conditions = @medicalhistory.medical_conditions.split(",")
    @medicalhistory.women = @medicalhistory.women.split(",")
    @medicalhistory.allergic = @medicalhistory.allergic.split(",")
  end

  def update
    print "came in update"
    @medicalhistory = Medicalhistory.find(params[:id])
    @edited_medicalhistory = params[:medicalhistory]
    params[:medicalhistory][:medical_conditions] = check_boxes(params[:medicalhistory][:medical_conditions])
    params[:medicalhistory][:women] = check_boxes(params[:medicalhistory][:women])
    params[:medicalhistory][:allergic] = check_boxes(params[:medicalhistory][:allergic])
    if @medicalhistory.update_attributes(@edited_medicalhistory)
      redirect_to @medicalhistory, :notice  => "Successfully updated medicalhistory."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @medicalhistory = Medicalhistory.find(params[:id])
    @medicalhistory.destroy
    redirect_to medicalhistories_url, :notice => "Successfully destroyed medicalhistory."
  end
end
