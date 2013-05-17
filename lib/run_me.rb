# encoding: UTF-8

require 'json'
require File.dirname(__FILE__) + '/mendeley.rb'
# staging: M = Mendeley.new("342b2d16ace018fd41026b61097d886804c1b954d", "92bf7f623d88c5816f888f274aad448e", "http://staging.mendeley.com")

Authorise.oapi_authorise("342b2d16ace018fd41026b61097d886804c1b954d", "92bf7f623d88c5816f888f274aad448e", "http://staging.mendeley.com")
m = Mendeley.new

res = m.profile_information("me")
puts JSON.parse(res.body)