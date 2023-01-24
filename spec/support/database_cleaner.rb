# typed: strict
# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner[:active_record].clean_with :truncation
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.before(:suite) do
    DatabaseCleaner[:active_record].clean_with :deletion, pre_count: true
  end

  config.around do |example|
    DatabaseCleaner[:active_record].strategy = Capybara.current_driver == :rack_test ? :transaction : :truncation

    DatabaseCleaner[:active_record].cleaning do
      example.run
    end
  end
end
