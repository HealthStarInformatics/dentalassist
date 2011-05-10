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

  def create
    session[:medicalhistory_params].deep_merge!(params[:medicalhistory]) if params[:medicalhistory]
    @medicalhistory= Medicalhistory.new(session[:medicalhistory_params])
    @medicalhistory.current_step = session[:form_step]
    if @medicalhistory.valid?
      if params[:back_button]
        @medicalhistory.previous_step
      elsif @medicalhistory.last_step?
        selected_conditions = []
        @medicalhistory.medical_conditions.each do |condition|
          selected_conditions.push(condition) unless condition.length <= 1
        end
        print @medicalhistory.women.size
        selected_women_conditions = []
        @medicalhistory.women.each do |women_condition|
          selected_women_conditions.push(women_condition) unless women_condition.length <= 1
        end
        selected_women_conditions = selected_women_conditions.join(",")
        selected_conditions = selected_conditions.join(",")
        @medicalhistory.medical_conditions = selected_conditions
        @medicalhistory.women = selected_women_conditions
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
