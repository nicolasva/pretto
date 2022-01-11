require 'test_helper'

class ProjectDecoratorTest < ActiveSupport::TestCase
  test "test process purcentage" do
    purcent_progress = Project.all.decorate.map(&:purcent)
    assert_equal purcent_progress, ["1/5 (20%)", "3/5 (60%)"]
  end
end
