require 'test_helper'

class DetailsMatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @details_match = details_matches(:one)
  end

  test "should get index" do
    get details_matches_url
    assert_response :success
  end

  test "should get new" do
    get new_details_match_url
    assert_response :success
  end

  test "should create details_match" do
    assert_difference('DetailsMatch.count') do
      post details_matches_url, params: { details_match: { event_id: @details_match.event_id, match_id: @details_match.match_id, minute: @details_match.minute, player_id: @details_match.player_id, team_id: @details_match.team_id } }
    end

    assert_redirected_to details_match_url(DetailsMatch.last)
  end

  test "should show details_match" do
    get details_match_url(@details_match)
    assert_response :success
  end

  test "should get edit" do
    get edit_details_match_url(@details_match)
    assert_response :success
  end

  test "should update details_match" do
    patch details_match_url(@details_match), params: { details_match: { event_id: @details_match.event_id, match_id: @details_match.match_id, minute: @details_match.minute, player_id: @details_match.player_id, team_id: @details_match.team_id } }
    assert_redirected_to details_match_url(@details_match)
  end

  test "should destroy details_match" do
    assert_difference('DetailsMatch.count', -1) do
      delete details_match_url(@details_match)
    end

    assert_redirected_to details_matches_url
  end
end
