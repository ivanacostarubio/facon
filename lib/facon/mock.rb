module Facon
  # Error returned when an expectation on a mock is not satisfied.
  class MockExpectationError < StandardError
  end

  class Mock
    include Facon::Mockable

    attr_accessor :name

    def initialize(name, stubs = {})
      @name = name
      stub_out(stubs)
    end

    private

      # Stubs out all the given stubs.
      def stub_out(stubs)
        stubs.each_pair do |method, response|
          stub!(method).and_return(response)
        end
      end
  end
end