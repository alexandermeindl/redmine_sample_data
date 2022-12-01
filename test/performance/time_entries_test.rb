# frozen_string_literal: true

require 'test_helper'
require 'rails/performance_test_help'

class IssuesTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { runs: 5, metrics: [:wall_time, :memory],
  #                          output: 'tmp/performance', formats: [:flat] }

  test 'time_entries' do
    get '/time_entries'
  end
end
