require 'test_helper'

class AvailableTimesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => AvailableTimes.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    AvailableTimes.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    AvailableTimes.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to available_times_url(assigns(:available_times))
  end

  def test_edit
    get :edit, :id => AvailableTimes.first
    assert_template 'edit'
  end

  def test_update_invalid
    AvailableTimes.any_instance.stubs(:valid?).returns(false)
    put :update, :id => AvailableTimes.first
    assert_template 'edit'
  end

  def test_update_valid
    AvailableTimes.any_instance.stubs(:valid?).returns(true)
    put :update, :id => AvailableTimes.first
    assert_redirected_to available_times_url(assigns(:available_times))
  end

  def test_destroy
    available_times = AvailableTimes.first
    delete :destroy, :id => available_times
    assert_redirected_to available_times_url
    assert !AvailableTimes.exists?(available_times.id)
  end
end
