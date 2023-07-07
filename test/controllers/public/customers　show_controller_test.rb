require "test_helper"

class Public::Customers　showControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get public_customers　show_edit_url
    assert_response :success
  end
end
