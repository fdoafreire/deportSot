require 'test_helper'

class ChampionshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @championship = championships(:one)
  end

  test "should get index" do
    get championships_url
    assert_response :success
  end

  test "should get new" do
    get new_championship_url
    assert_response :success
  end

  test "should create championship" do
    assert_difference('Championship.count') do
      post championships_url, params: { championship: { date_end_inscription: @championship.date_end_inscription, date_initial_inscription: @championship.date_initial_inscription, name: @championship.name, quantity_min_teams: @championship.quantity_min_teams } }
    end

    assert_redirected_to championship_url(Championship.last)
  end

  test "should show championship" do
    get championship_url(@championship)
    assert_response :success
  end

  test "should get edit" do
    get edit_championship_url(@championship)
    assert_response :success
  end

  test "should update championship" do
    patch championship_url(@championship), params: { championship: { date_end_inscription: @championship.date_end_inscription, date_initial_inscription: @championship.date_initial_inscription, name: @championship.name, quantity_min_teams: @championship.quantity_min_teams } }
    assert_redirected_to championship_url(@championship)
  end

  test "should destroy championship" do
    assert_difference('Championship.count', -1) do
      delete championship_url(@championship)
    end

    assert_redirected_to championships_url
  end
end
