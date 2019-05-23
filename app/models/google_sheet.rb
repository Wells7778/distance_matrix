require 'google/apis/sheets_v4'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'

class GoogleSheet
  OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'.freeze
  APPLICATION_NAME = 'Google Sheets'.freeze
  CREDENTIALS_PATH = 'config/google_credentials.json'.freeze
  TOKEN_PATH = 'token.yaml'.freeze
  SCOPE = Google::Apis::SheetsV4::AUTH_SPREADSHEETS_READONLY

  ##
  # Ensure valid credentials, either by restoring from the saved credentials
  # files or intitiating an OAuth2 authorization. If authorization is required,
  # the user's default browser will be launched to approve the request.
  #
  # @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
  def self.authorize
    client_id = Google::Auth::ClientId.from_file(CREDENTIALS_PATH)
    token_store = Google::Auth::Stores::FileTokenStore.new(file: TOKEN_PATH)
    authorizer = Google::Auth::UserAuthorizer.new(client_id, SCOPE, token_store)
    user_id = 'default'
    credentials = authorizer.get_credentials(user_id)
    if credentials.nil?
      url = authorizer.get_authorization_url(base_url: OOB_URI)
      puts 'Open the following URL in the browser and enter the ' \
          "resulting code after authorization:\n" + url
      code = gets
      credentials = authorizer.get_and_store_credentials_from_code(
        user_id: user_id, code: code, base_url: OOB_URI
      )
    end
    credentials
  end

  def self.get_sheet_array_from_google_sheet(options = {})
    service = Google::Apis::SheetsV4::SheetsService.new
    service.authorization = get_google_auth
    response = service.get_spreadsheet_values(
      "1oU-8DlwEgO1UiP-vGaRnp4lkMaXy8auFF-qR95XrbJw",
      "services!A1:I1000"
    ).values
    # service.client_options.application_name = APPLICATION_NAME
    # service.authorization = GoogleSheet.authorize

    # response = service.get_spreadsheet_values("1oU-8DlwEgO1UiP-vGaRnp4lkMaXy8auFF-qR95XrbJw", "services!A1:I1000")
    result = []
    if response.size == 0
      result << { status: "EMPTY"}
    else
      response.each_with_index do |row, index|
        if index > 0
          result << {
                      tag: row[0],
                      no: row[1],
                      name: row[2],
                      lat: row[3],
                      lng: row[4],
                      post_code: row[5],
                      service_time: row[6],
                      priority: row[7],
                      status: row[8]
                    }
        end
      end
    end
    return result
  end

  def self.get_google_auth
    scope = [Google::Apis::SheetsV4::AUTH_SPREADSHEETS_READONLY]
    file = File.open("config/google_credentials.json", 'r')
    authorization = Google::Auth::ServiceAccountCredentials.make_creds({:json_key_io=> file, :scope => scope})
  end
end