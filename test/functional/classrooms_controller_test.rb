require File.dirname(__FILE__) + '/../test_helper'
require 'classrooms_controller'

# Re-raise errors caught by the controller.
class ClassroomsController; def rescue_action(e) raise e end; end

class ClassroomsControllerTest < Test::Unit::TestCase
  fixtures :classrooms

  def setup
    @controller = ClassroomsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:classrooms)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_classroom
    old_count = Classroom.count
    post :create, :classroom => { }
    assert_equal old_count+1, Classroom.count
    
    assert_redirected_to classroom_path(assigns(:classroom))
  end

  def test_should_show_classroom
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_classroom
    put :update, :id => 1, :classroom => { }
    assert_redirected_to classroom_path(assigns(:classroom))
  end
  
  def test_should_destroy_classroom
    old_count = Classroom.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Classroom.count
    
    assert_redirected_to classrooms_path
  end
end
