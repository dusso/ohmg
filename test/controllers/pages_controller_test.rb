require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get help" do
    get pages_help_url
    assert_response :success
  end

  test "should get rules" do
    get pages_rules_url
    assert_response :success
  end

  test "should get terms" do
    get pages_terms_url
    assert_response :success
  end

  test "should get conditions" do
    get pages_conditions_url
    assert_response :success
  end
end
