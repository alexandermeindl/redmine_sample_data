# frozen_string_literal: true

require File.expand_path "#{File.dirname __FILE__}/../../../test/test_helper"

module RedmineSampleData
  module TestHelper
    def prepare_tests; end

    def first_non_admin_user
      User.active.where(admin: false).first
    end
  end

  class ControllerTest < Redmine::ControllerTest
    include RedmineSampleData::TestHelper
  end

  class TestCase < ActiveSupport::TestCase
    include RedmineSampleData::TestHelper
  end
end
