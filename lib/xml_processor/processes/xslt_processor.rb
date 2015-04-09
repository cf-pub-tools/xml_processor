require 'nokogiri'

module XmlProcessor
  module Processes
    class XsltProcessor
      def initialize(xslt, dest_extension: '.html')
        @xslt = xslt
        @dest_extension = dest_extension
      end

      def call(files)
        files.reduce({}) do |hash, (filename, file_content)|
          document = Nokogiri::XML(file_content)
          template = Nokogiri::XSLT(xslt)

          html_filename = filename.to_s.split('.').first + dest_extension
          transformed_data = template.transform(document).to_xml

          hash.merge({html_filename => transformed_data})
        end
      end

      private

      attr_reader :xslt, :dest_extension
    end
  end
end
