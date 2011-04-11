require 'test_helper'

class MedicalhistoriesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Medicalhistory.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Medicalhistory.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Medicalhistory.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to medicalhistory_url(assigns(:medicalhistory))
  end

  def test_edit
    get :edit, :id => Medicalhistory.first
    assert_template 'edit'
  end

  def test_update_invalid
    Medicalhistory.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Medicalhistory.first
    assert_template 'edit'
  end

  def test_update_valid
    Medicalhistory.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Medicalhistory.first
    assert_redirected_to medicalhistory_url(assigns(:medicalhistory))
  end

  def test_destroy
    medicalhistory = Medicalhistory.first
    delete :destroy, :id => medicalhistory
    assert_redirected_to medicalhistories_url
    assert !Medicalhistory.exists?(medicalhistory.id)
  end
end
