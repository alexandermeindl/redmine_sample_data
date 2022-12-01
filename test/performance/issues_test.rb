# frozen_string_literal: true

require 'test_helper'
require 'rails/performance_test_help'

class IssuesTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { runs: 5, metrics: [:wall_time, :memory],
  #                          output: 'tmp/performance', formats: [:flat] }

  test 'issues' do
    get '/issues'
  end

  test 'issue' do
    get '/issues/1'
  end
end
