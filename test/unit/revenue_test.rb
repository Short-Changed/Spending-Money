require 'test_helper'

class RevenueTest < ActiveSupport::TestCase

  test 'exercise' do
    Revenue.create(:year => 2013, :amount => 63000000)
  end
end
