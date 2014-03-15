require 'test_helper'

class CharacterTest < ActiveSupport::TestCase

  test 'should not save without a campaign object' do
    assert true, 'true'
    character = characters(:jowan_char)
    character.campaign_object = nil
    assert !character.valid?, 'Saves without a campaign object'
    assert_equal 'No campaign object detected', character.errors[:campaign_object].first, 'Will not save without a campaign object.'
  end

end
