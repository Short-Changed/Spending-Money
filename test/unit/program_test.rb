require 'test_helper'

class ProgramTest < ActiveSupport::TestCase

  test 'exercise' do
    Program.create!
  end

  test 'belongs to department' do
    assert_nil Program.create!.department
  end

end
