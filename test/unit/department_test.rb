require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  test 'exercise' do
    Department.create!(:name => 'foo name')
  end

  test 'has many programs' do
    Department.first.programs.build.tap do |t|
     t.name = 'foo name'
    end.save!
  end
end
