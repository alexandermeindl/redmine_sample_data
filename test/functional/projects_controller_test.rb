# frozen_string_literal: true

require File.expand_path '../../test_helper', __FILE__

class ProjectsControllerTest < RedmineSampleData::ControllerTest
  def setup
    @user = first_non_admin_user
    User.current = @user
  end

  def test_index
    @request.session[:user_id] = 2

    get :index,
        params: { display_type: 'list' }

    assert_response :success
  end

  def test_index_with_board
    @request.session[:user_id] = 2

    get :index,
        params: { display_type: 'board' }

    assert_response :success
  end

  def test_index_without_filter
    @request.session[:user_id] = 2

    get :index,
        params: { set_filter: 1 }

    assert_response :success
  end
end
