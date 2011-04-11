class FormsController < ApplicationController
  def index
    @forms = Forms.all
  end

  def show
    @forms = Forms.find(params[:id])
  end

  def new
    @forms = Forms.new
  end

  def create
    @forms = Forms.new(params[:forms])
    if @forms.save
      redirect_to @forms, :notice => "Successfully created forms."
    else
      render :action => 'new'
    end
  end

  def edit
    @forms = Forms.find(params[:id])
  end

  def update
    @forms = Forms.find(params[:id])
    if @forms.update_attributes(params[:forms])
      redirect_to @forms, :notice  => "Successfully updated forms."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @forms = Forms.find(params[:id])
    @forms.destroy
    redirect_to forms_url, :notice => "Successfully destroyed forms."
  end
end
