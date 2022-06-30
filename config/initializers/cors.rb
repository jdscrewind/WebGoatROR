Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
        origins '*' #['https://example.com', 'https://stackoverflow.com']
        resource '*', #%r{/users/\d+.json},
        :headers => ['Origin', 'Accept', 'Content-Type'], #:any, #['Origin', 'Accept', 'Content-Type'],
        :methods => [:post, :get]
    end
end


# fetch('http://localhost:3000', {
#     method: 'get',
#     mode: 'cors',
#     headers: {
#         'Access-Control-Allow-Origin': 'https://example.com'
#     }
# }).then(response => {
#     console.log(response);
# }).catch(error => {
#     console.log(error);
# });