# frozen_string_literal: true

require 'test_helper'

class ProjectTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { runs: 5, metrics: [:wall_time, :memory],
  #                          output: 'tmp/performance', formats: [:flat] }

  test 'projects' do
    get '/projects'
  end
end