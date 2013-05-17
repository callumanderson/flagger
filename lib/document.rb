require 'json'
require_relative 'mendeley'

class Document
  # To change this template use File | Settings | File Templates.

  def get_title(id)
    if exists(id)
        title = get_doc_from_mendeley(id)
        printer = Printer.new(title)
        print "Document title is: '#{title}' \nFlagging document\n"
        print "...\n\n"
        sleep(2)
        printer.print_flag
      else print "Couldn't find id #{id} via the api"
      end
  end

  def prompt
    print "Enter a search term -> "
    id = STDIN.gets.chomp
    get_title(id)
  end

  def exists(id)
    #Check id exists via api
    id ? true : false
  end

  def get_doc_from_mendeley(id)
    Authorise.oapi_authorise("342b2d16ace018fd41026b61097d886804c1b954d", "92bf7f623d88c5816f888f274aad448e", "http://staging.mendeley.com")
    m = Mendeley.new
    res = m.document_search(id.to_s)
    first_item = JSON.parse(res.body)
    docs =  first_item["documents"]
    doc = docs[0]
    return doc["title"]
  end

end