require 'digest'

module TwistlockControl
	class ContainerDescription
	end

	class Container < Entity
		attribute :id, String, :default => :generate_id
		attribute :url, String
		attribute :description, ContainerDescription

		def generate_id
			Digest::SHA256.hexdigest(url)
		end

		def get_description
			d = Provisioner.local.get_container_description(url)
		end

		def save
			ContainerRepository.save(self.attributes)
		end

		def remove
			ContainerRepository.remove(id)
		end

		def self.find_by_id(id)
			if attributes = ContainerRepository.find_by_id(id)
				new(attributes)
			else
				nil
			end
		end

		def self.find_with_ids(ids)
			ContainerRepository.find_with_ids(ids).map {|a| new(a) }
		end

		def self.all()
			ContainerRepository.all.map {|a| new(a) }
		end
	end
end
