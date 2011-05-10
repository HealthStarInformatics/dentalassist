# config/initializers/pdfkit.rb  
  
PDFKit.configure do |config|       
     config.wkhtmltopdf = Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s if ::Rails.env == 'production'  
     config.default_options = {
      :page_size => 'Legal',
      :print_media_type => true,
      :disable_javascript => true
      }
end  
