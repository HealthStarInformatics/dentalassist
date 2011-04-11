require 'test_helper'

class FormsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Forms.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Forms.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Forms.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to forms_url(assigns(:forms))
  end

  def test_edit
    get :edit, :id => Forms.first
    assert_template 'edit'
  end

  def test_update_invalid
    Forms.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Forms.first
    assert_template 'edit'
  end

  def test_update_valid
    Forms.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Forms.first
    assert_redirected_to forms_url(assigns(:forms))
  end

  def test_destroy
    forms = Forms.first
    delete :destroy, :id => forms
    assert_redirected_to forms_url
    assert !Forms.exists?(forms.id)
  end
end
