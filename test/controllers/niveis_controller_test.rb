require 'test_helper'

class NiveisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get niveis_index_url
    assert_response :success
  end

end
