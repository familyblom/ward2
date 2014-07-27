require "test_helper"

class SurveysControllerTest < ActionController::TestCase

  def survey
    @survey ||= surveys :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:surveys)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Survey.count') do
      post :create, survey: {  }
    end

    assert_redirected_to survey_path(assigns(:survey))
  end

  def test_show
    get :show, id: survey
    assert_response :success
  end

  def test_edit
    get :edit, id: survey
    assert_response :success
  end

  def test_update
    put :update, id: survey, survey: {  }
    assert_redirected_to survey_path(assigns(:survey))
  end

  def test_destroy
    assert_difference('Survey.count', -1) do
      delete :destroy, id: survey
    end

    assert_redirected_to surveys_path
  end
end
