require 'test_helper'

class SpendingControllerTest < ActionController::TestCase

  test "index" do
    get :index
    assert_response :ok
  end

end
