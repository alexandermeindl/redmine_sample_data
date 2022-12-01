# frozen_string_literal: true

require File.expand_path '../../test_helper', __FILE__

class IssuesControllerTest < RedmineSampleData::ControllerTest
  def setup
    @user = first_non_admin_user
    User.current = @user
  end

  def test_issue
    @request.session[:user_id] = @user.id

    binding.break
    issue = Issue.visible.first
    get :show, params: { id: issue.id }

    assert_response :success
  end

  def test_issues
    @request.session[:user_id] = @user.id
    get :index

    assert_response :success
  end

  def test_issues_without_filters
    @request.session[:user_id] = @user.id
    get :index, params: { set_filters: 1 }

    assert_response :success
  end
end
