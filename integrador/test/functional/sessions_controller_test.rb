require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Session.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Session.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Session.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to session_url(assigns(:session))
  end

  def test_edit
    get :edit, :id => Session.first
    assert_template 'edit'
  end

  def test_update_invalid
    Session.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Session.first
    assert_template 'edit'
  end

  def test_update_valid
    Session.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Session.first
    assert_redirected_to session_url(assigns(:session))
  end

  def test_destroy
    session = Session.first
    delete :destroy, :id => session
    assert_redirected_to sessions_url
    assert !Session.exists?(session.id)
  end
end
