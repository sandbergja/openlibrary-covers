# frozen_string_literal: true

require 'openlibrary/covers/version'
require 'net/http'

module Openlibrary
  module Covers
    ##
    # An Image from the OpenLibrary API, if one exists
    class Image
      ##
      # @param [String, Array<string>] identifiers the actual values to look up
      # @param [String, Symbol] identifier_type
      def initialize(identifiers, identifier_type = :isbn)
        identifiers = Array(identifiers)
        @identifier_type = identifier_type

        @found = false

        @successful_identifier = identifiers.detect { |identifier| image_exists(identifier) }
        @found = true if @successful_identifier
      end

      def found?
        @found
      end

      ##
      # @param [String, Symbol] size (can be 'S', 'M', 'L', :S, :M, :L)
      def url(size = 'M')
        @found ? openlibrary_url(@successful_identifier, size) : nil
      end

      private

      def openlibrary_domain
        'covers.openlibrary.org'
      end

      def openlibrary_port
        80
      end

      def openlibrary_url(identifier, size, default_behavior: true)
        "http://#{openlibrary_domain}#{openlibrary_path(identifier, size, default_behavior: default_behavior)}"
      end

      def openlibrary_path(identifier, size, default_behavior: true)
        base_path = "/b/#{@identifier_type}/#{identifier}-#{size}.jpg"
        default_behavior ? base_path : "#{base_path}?default=false"
      end

      def image_exists(identifier)
        response = nil
        begin
          Net::HTTP.start(openlibrary_domain, openlibrary_port) do |http|
            response = http.head(openlibrary_path(identifier, :S, default_behavior: false))
          end
        rescue Errno::ECONNREFUSED, SocketError
          return false
        end
        return true if %w[200 301 302].include? response.code

        false
      end
    end
  end
end
