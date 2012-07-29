require 'test_helper'

class ExpendituresControllerTest < ActionController::TestCase

  test "the truth" do
    get :index
    assert_response :ok
  end

end
