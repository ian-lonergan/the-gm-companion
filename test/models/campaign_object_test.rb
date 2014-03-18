require 'test_helper'

class CampaignObjectTest < ActiveSupport::TestCase
  
  test 'should not save without a name' do
    assert true, 'Just plain true'
    campaign_object = campaign_objects(:jowan)
    campaign_object.name = ''
    assert !campaign_object.valid?, 'Saves without a name'
    assert_equal 'Please enter a name', campaign_object.errors[:name].first, 'Will not save without a name.'
  end
  
  test 'should not save without an abstract' do
    campaign_object = campaign_objects(:anya)
    campaign_object.abstract = ''
    assert !campaign_object.valid?, 'Saves without an abstract'
    assert_equal 'Please enter an abstract', campaign_object.errors[:abstract].first, 'Will not save without an abstract.'
  end
  
end