class MedicalhistoriesController < ApplicationController
  def index
    if current_user and !current_user.username.eql?('bsharma')
      @medicalhistories = []
      @record = Medicalhistory.find(current_user.id)
      @medicalhistories<<@record
    end
    if current_user.username.eql?('bsharma')
      @medicalhistories = Medicalhistory.find(:all)
    end
  end


  def show
    
    @medicalhistory = Medicalhistory.find(current_user.id)
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
#  print "session - created_user " + session[:created_user] if session[:created_user] != nil
#    if (!session[:created_user].eql?("created") && @medicalhistory.user.valid? && @medicalhistory.valid?) || session[:created_user].eql?("created")
    if (@medicalhistory.user.valid? && @medicalhistory.valid?) 
  if params[:back_button]
        @medicalhistory.previous_step
      elsif @medicalhistory.last_step?
        @medicalhistory.medical_conditions = check_boxes(@medicalhistory.medical_conditions)
        @medicalhistory.women = check_boxes(@medicalhistory.women) 
        @medicalhistory.allergic = check_boxes(@medicalhistory.allergic)
        @medicalhistory.save if @medicalhistory.all_valid?
      else
#if @medicalhistory.current_step.eql?("about")
#         print "\nbefore (new_creation)" + @medicalhistory.user.new_record?.to_s
#            @medicalhistory.user.save if @medicalhistory.user.valid?
#            flash[:notice] = "#{@medicalhistory.user.email} successfully registered. Continue to fill the form or login and fill it later"
#            print "\nafter (new record)" + @medicalhistory.user.new_record?.to_s
#            session[:created_user] = "created";
#        end
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
    @medicalhistory = Medicalhistory.find(params[:id])
  end

  def update
    @medicalhistory = Medicalhistory.find(params[:id])
    if @medicalhistory.update_attributes(params[:medicalhistory])
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
