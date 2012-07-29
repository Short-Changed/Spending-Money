require 'test_helper'

class FunctionTest < ActiveSupport::TestCase

  test 'exercise' do
    Function.create!(:name => 'Law')
  end

end
