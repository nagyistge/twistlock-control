require 'spec_helper'

include TwistlockControl

describe RethinkDBRepository do
	it 'should be able to find documents with ids' do
		app = {
			id: 'my-app',
			name: 'My App'
		}
		repo = RethinkDBRepository['services']
		repo.save(app)
		expect(repo.find_with_ids([app[:id]]).length).to be(1)
	end
end
