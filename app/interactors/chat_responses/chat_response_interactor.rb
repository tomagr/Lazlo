class ChatResponseInteractor < Interactor
	attr_accessor :pluralize, :existing_records, :non_existing_records_names, :response

	def initialize(arguments)
		super(arguments)
		@dialog_flow_response = Hash.new
		@dialog_flow_response[:source] = Settings.urls.base

		self.pluralize = false
		self.existing_records = []
		self.non_existing_records_names = []
		self.response = ''
	end

	# Todo - Return rich text with fulfillmentMessages param
	def execute
		@dialog_flow_response[:fulfillmentText] = self.response
		@dialog_flow_response
	end


	def identify_objects_by_name model:, names:
		names.each do |name|
			model_object = model.find_by("name LIKE ? ", "%#{ strip_query(name) }%")
			model_object.present? ? existing_records.push(model_object) : non_existing_records_names.push(name)
		end unless names.empty?

	end

	def existing_records_response extra_response
		if existing_records.present?
			self.response += 'Si tenemos '
			existing_records.each do |record|
				self.response += "#{record.name.capitalize},"
				self.response += extra_response.call record
			end
		end
	end

	def existing_records_response_with_price extra_response
		if existing_records.present?
			self.response += "Si, tenemos. Te paso los precios: \n\n"
			existing_records.each do |record|
				self.response += "#{record.name.capitalize}: #{format_price record.price}"
				self.response += extra_response.call(record) + "\n\n"
			end
		end
	end

	def non_existing_records_response
		if non_existing_records_names.present?
			self.response += 'Por el momento no trabajamos con '
			non_existing_records_names.each_with_index do |name, i|
				self.response += i != 0 ? ' ni con ' : ''
				self.response += name
			end
			self.response += " pero mandanos un mail a hola@lazlo.la y te podemos cotizar el producto a medida"
		end
	end

	def strip_query name
		#Remove special chars
		parsed_query = name.gsub!(/[^abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ ]/, '')
		clean_query = parsed_query.nil? ? name : parsed_query

		#Remove front and last spaces
		clean_query = clean_query.split(' ').join(' ')

		#Make plural or singular
		first_word = pluralize ? clean_query.partition(" ").first.pluralize : clean_query.partition(" ").first.singularize
		clean_query = first_word +  " " + clean_query.split(' ')[1..-1].join(' ')
		clean_query
	end

	private

	def self.url_for url
		Rails.application.routes.url_helpers.url_for url
	end

	def self.format_price price
		ApplicationController.helpers.format_price price
	end

end