# Note: nested tables could potentially fail with the given regexp strategy.
Then /^I should see a row with "([^"]*)" and then "([^"]*)"$/ do |str1, str2|

  # In English: a non-capturing sequence of zero or more elements, each of which
  # either not '<', or is '<' but is not then followed by the rest of a TR closing tag.
  not_tr_close = "(?:[^<]|<(?!/\s*[tT][rR]\s*>))*"

  regexp = /<tr[^>]*>#{not_tr_close}#{str1}#{not_tr_close}#{str2}#{not_tr_close}<\/tr>/m

  # It would be nice to 
  # This copied from web_steps::Then I should see /.../
  # Can't call it directly because our regexp contains /
  regexp = Regexp.new(regexp)

  class MatcherWrapper
    def initialize(state)
      @matches = state
    end
    
    def matches?(needed_but_ignored)
      return @matches
    end

    def failure_message
      "MatcherWrapper failed"
    end
  end

  page.should MatcherWrapper.new(regexp.match(page.body))
end

Then /^I should not see a row with "([^\"]*)" and then "([^\"]*)"$/ do |str1, str2|
  should_throw = false

  begin
    Then "I should see a row with \"#{str1}\" and then \"#{str2}\""
    should_throw = true
  rescue RSpec::Expectations::ExpectationNotMetError
    # Since we're reversing the sense of the test, this is actually the normal, expected path.
    # So just swallow the exception.
  end

  raise RSpec::Expectations::ExpectationNotMetError if should_throw
end
