
require 'xml'

require 'rexml/document'
include REXML

require 'xml/libxml'

require 'nokogiri'

class XxeController < ApplicationController
  @@xml_file_path = "app/assets/xml/test.xml"
  # @@hardcoded_xml = '<?xml version="1.0"?>' +
  #   '<!DOCTYPE foo [  '+
  #   '<!ELEMENT foo (#ANY)>'+
  #   '<!ENTITY xxe SYSTEM "file:///' + @@xml_file_path + '">]><foo>&xxe;</foo>'
  @@hardcoded_xml = '<!DOCTYPE replace [<!ENTITY example "Doe"> ]>'+
    '<userInfo>'+
    '<firstName>John</firstName>'+
    '<lastName>&example;</lastName>'+
    '</userInfo>'
  
  def index
    # None of the payloads from https://github.com/payloadbox/xxe-injection-payload-list worked
    # Inputs
    param_xxe = params[:param_xxe] || ''

    # XML
    @stored_xxe = XML::Document.file(@@xml_file_path)
    @xxe = XML::Document.new(param_xxe)

    @parser = XML::Parser.file(@@xml_file_path)

    # REXML these are all safe, at least this version
    file = File.new(@@xml_file_path)
    @stored_xxe_rexml = Document.new(file)
    # @xxe_rexml = Document.new(param_xxe)        # TRIGGER ERROR

    # LIBXML
    # STORED XXE
    @stored_xxe_libxml = LibXML::XML::Document.file(@@xml_file_path)
    @xxe = LibXML::XML::Document.new(param_xxe)
    @xxe_fp_libxml = LibXML::XML::Document.new(@@hardcoded_xml)

    # nokogiri
    sample_data = File.open(@@xml_file_path)
    @stored_xxe_ng = Nokogiri::XML(sample_data)
    @xxe_ng = Nokogiri::XML(param_xxe)
    @xxe_fp_ng = Nokogiri::XML(@@hardcoded_xml)
  end
end
