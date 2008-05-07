require File.dirname(__FILE__) + '/../test_helper'
require 'subjects_controller'

# Re-raise errors caught by the controller.
class SubjectsController; def rescue_action(e) raise e end; end

class SubjectsControllerTest < Test::Unit::TestCase
  fixtures :subjects

  def setup
    @controller = SubjectsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:subjects)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_subject
    old_count = Subject.count
    post :create, :subject => { }
    assert_equal old_count+1, Subject.count
    
    assert_redirected_to subject_path(assigns(:subject))
  end

  def test_should_show_subject
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_subject
    put :update, :id => 1, :subject => { }
    assert_redirected_to subject_path(assigns(:subject))
  end
  
  def test_should_destroy_subject
    old_count = Subject.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Subject.count
    
    assert_redirected_to subjects_path
  end
end
