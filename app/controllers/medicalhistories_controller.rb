class MedicalhistoriesController < ApplicationController
  def index
    @medicalhistories = Medicalhistory.all
  end

  def pdf
    redirect_to "http://cricinfo.com"
  end

  def show
    @medicalhistory = Medicalhistory.find(params[:id])
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
    print "came here" +  session[:form_step] unless session[:form_step] == nil
    if @medicalhistory.valid?
      if params[:back_button]
        @medicalhistory.previous_step
      elsif @medicalhistory.last_step?
        @medicalhistory.medical_conditions = check_boxes(@medicalhistory.medical_conditions)
        @medicalhistory.women = check_boxes(@medicalhistory.women) 
        @medicalhistory.allergic = check_boxes(@medicalhistory.allergic)
        @medicalhistory.save if @medicalhistory.all_valid?
      else
        @medicalhistory.next_step
        print "test2" + @medicalhistory.dob.to_s
      end
      session[:form_step] = @medicalhistory.current_step
    end
    if @medicalhistory.new_record?
      render "new"
    else
      session[:form_step] = session[:medicalhistory_params] = nil
      flash[:notice] = "New Patient Registration Complete!"
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
