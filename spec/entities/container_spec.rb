require 'spec_helper'
require 'entities/shared_service_specs'

include TwistlockControl
describe Container do
	it_should_behave_like 'a service'
end
