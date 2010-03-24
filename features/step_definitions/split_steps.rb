Given /^Incognito instance object$/ do
  @incognito = Incognito.new
end

When /^I assign (.+) to incognito$/ do |full_name|
 @incognito.full_name = full_name
end

Then /^he should have a (.+) and a (.+)$/ do |first_name, last_name|
  @incognito.first_name.should == first_name
  @incognito.last_name.should  == last_name
end

Then /^he should have partial (.+) or partial (.+)$/ do |first_name, last_name|
  @incognito.first_name.inspect.should == first_name
  @incognito.last_name.inspect.should  == last_name
end
