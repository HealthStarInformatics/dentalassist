require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Locations.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Locations.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Locations.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to locations_url(assigns(:locations))
  end

  def test_edit
    get :edit, :id => Locations.first
    assert_template 'edit'
  end

  def test_update_invalid
    Locations.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Locations.first
    assert_template 'edit'
  end

  def test_update_valid
    Locations.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Locations.first
    assert_redirected_to locations_url(assigns(:locations))
  end

  def test_destroy
    locations = Locations.first
    delete :destroy, :id => locations
    assert_redirected_to locations_url
    assert !Locations.exists?(locations.id)
  end
end
