# frozen_string_literal: true

require 'test_helper'

class IssueTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { runs: 5, metrics: [:wall_time, :memory],
  #                          output: 'tmp/performance', formats: [:flat] }

  test 'issues' do
    @request.session[:user_id] = 2
    get '/issues'
  end

  test 'issue' do
    @request.session[:user_id] = 2
    get '/issues/1'
  end
end
