# frozen_string_literal: true

require_relative '../archive_to_app'

archive_to_app do |c|
  c.name = "Visual Studio Code"
  c.short_name = 'vscode'
  c.add_download(:linux, 'https://go.microsoft.com/fwlink/?LinkID=620884', 'tgz', 1)
end
