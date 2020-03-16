require 'test_helper'

class TodolistControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get todolist_index_url
    assert_response :success
  end

end
