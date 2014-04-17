class EncounterOpponentsController < ApplicationController
  #autocomplete :campaign_object, :name, scopes: [:character]
  autocomplete :campaign_object, :name, full: true, scopes: [:character], extra_data: [:campaign_object_holder_id]
end