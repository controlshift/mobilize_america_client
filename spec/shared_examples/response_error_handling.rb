RSpec.shared_examples_for 'response error handling' do
  let(:response_headers) { {'Content-Type' => 'application/json'} }

  before :each do
    set_up_stub_request.call
  end

  context 'response status is 400' do
    let(:response_status) { 400 }
    let(:response_body) { {error: 'bad request'}.to_json }

    it 'should raise ClientError' do
      expect{ call_client_method.call }.to raise_error(MobilizeAmericaClient::ClientError, /Client Error \(400\)/)
    end
  end

  context 'response status is 401' do
    let(:response_status) { 401 }
    let(:response_body) { {error: 'unauthorized'}.to_json }

    it 'should raise UnauthorizedError' do
      expect { call_client_method.call }.to raise_error MobilizeAmericaClient::UnauthorizedError
    end
  end

  context 'response status is 404' do
    let(:response_status) { 404 }
    let(:response_body) { {error: 'not found'}.to_json }

    it 'should raise NotFoundError' do
      expect{ call_client_method.call }.to raise_error MobilizeAmericaClient::NotFoundError
    end
  end

  context 'response status is 422' do
    let(:response_status) { 422 }
    let(:response_body) { {error: 'unprocessable entity'}.to_json }

    it 'should raise ClientError' do
      expect{ call_client_method.call }.to raise_error(MobilizeAmericaClient::ClientError, /Client Error \(422\)/)
    end
  end

  context 'response status is 429' do
    let(:response_status) { 429 }
    let(:response_body) { {error: 'rate-limited'}.to_json }

    it 'should raise RateLimitedError' do
      expect{ call_client_method.call }.to raise_error(MobilizeAmericaClient::RateLimitedError)
    end

    context 'with a Retry-After header' do
      let(:response_headers) { {'Content-Type' => 'application/json', 'Retry-After' => '3600'} }

      it 'should raise include that info in the error' do
        expect{ call_client_method.call }.to raise_error(MobilizeAmericaClient::RateLimitedError, /3600/)
      end
    end
  end

  context 'response status is 500' do
    let(:response_status) { 500 }
    let(:response_body) { {error: 'internal server error'}.to_json }

    it 'should raise ServerError' do
      expect{ call_client_method.call }.to raise_error(MobilizeAmericaClient::ServerError, /Server Error \(500\)/)
    end
  end

  context 'response status is 503' do
    let(:response_status) { 503 }
    let(:response_body) { 'Service Unavailable' }
    let(:response_headers) { {} }

    it 'should raise ServerError' do
      expect{ call_client_method.call }.to raise_error(MobilizeAmericaClient::ServerError, /Server Error \(503\)/)
    end
  end
end
