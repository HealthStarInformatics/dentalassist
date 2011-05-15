require 'test_helper'

class DentistriesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Dentistry.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Dentistry.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Dentistry.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to dentistry_url(assigns(:dentistry))
  end

  def test_edit
    get :edit, :id => Dentistry.first
    assert_template 'edit'
  end

  def test_update_invalid
    Dentistry.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Dentistry.first
    assert_template 'edit'
  end

  def test_update_valid
    Dentistry.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Dentistry.first
    assert_redirected_to dentistry_url(assigns(:dentistry))
  end

  def test_destroy
    dentistry = Dentistry.first
    delete :destroy, :id => dentistry
    assert_redirected_to dentistries_url
    assert !Dentistry.exists?(dentistry.id)
  end
end
