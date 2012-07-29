require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  test 'exercise' do
    Department.create!(:name => 'foo name')
  end
end
