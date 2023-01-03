import Foundation
import WalletConnectNetworking

public struct EchoClientFactory {
    public static func create(projectId: String, clientId: String) -> EchoClient {

        let httpClient = HTTPNetworkClient(host: "echo.walletconnect.com")

        return EchoClientFactory.create(
            projectId: projectId,
            clientId: clientId,
            httpClient: httpClient)
    }

    static func create(projectId: String,
                       clientId: String,
                       httpClient: HTTPClient) -> EchoClient {

        let logger = ConsoleLogger(loggingLevel: .debug)
        let registerService = EchoRegisterService(httpClient: httpClient, projectId: projectId, clientId: clientId, logger: logger)

        return EchoClient(
            registerService: registerService)
    }
}
