require File.dirname(__FILE__) + '/../test_helper'
require 'diario_de_classe_posts_controller'

# Re-raise errors caught by the controller.
class DiarioDeClassePostsController; def rescue_action(e) raise e end; end

class DiarioDeClassePostsControllerTest < Test::Unit::TestCase
  fixtures :diario_de_classe_posts

  def setup
    @controller = DiarioDeClassePostsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:diario_de_classe_posts)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_diario_de_classe_post
    old_count = DiarioDeClassePost.count
    post :create, :diario_de_classe_post => { }
    assert_equal old_count+1, DiarioDeClassePost.count
    
    assert_redirected_to diario_de_classe_post_path(assigns(:diario_de_classe_post))
  end

  def test_should_show_diario_de_classe_post
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_diario_de_classe_post
    put :update, :id => 1, :diario_de_classe_post => { }
    assert_redirected_to diario_de_classe_post_path(assigns(:diario_de_classe_post))
  end
  
  def test_should_destroy_diario_de_classe_post
    old_count = DiarioDeClassePost.count
    delete :destroy, :id => 1
    assert_equal old_count-1, DiarioDeClassePost.count
    
    assert_redirected_to diario_de_classe_posts_path
  end
end
