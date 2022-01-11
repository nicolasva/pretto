require 'test_helper'

class ProjectServiceTest < ActiveSupport::TestCase
  test "project with purcent progression" do
    assert_equal ProjectService.call(Project.all).pluck(:purcent), ["1/5 (20%)", "3/5 (60%)"]
  end
end