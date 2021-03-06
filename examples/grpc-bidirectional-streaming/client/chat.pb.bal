// This is an auto generated client stub which is used to communicate between gRPC client.
import ballerina/grpc;
import ballerina/io;

// Non-blocking client
public type ChatStub object {
    public {
        grpc:Client clientEndpoint;
        grpc:Stub stub;
    }

    function initStub(grpc:Client clientEndpoint) {
        grpc:Stub navStub = new;
        navStub.initStub(clientEndpoint, "non-blocking", DESCRIPTOR_KEY, descriptorMap);
        self.stub = navStub;
    }

    function chat(typedesc listener, grpc:Headers... headers) returns (grpc:Client|error) {
        var res = self.stub.streamingExecute("Chat/chat", listener, ...headers);
        match res {
            error err => {
                return err;
            }
            grpc:Client con => {
                return con;
            }
        }
    }
};

// Non-blocking client endpoint
public type ChatClient object {
    public {
        grpc:Client client;
        ChatStub stub;
    }

    public function init(grpc:ClientEndpointConfig config) {
        // initialize client endpoint.
        grpc:Client client = new;
        client.init(config);
        self.client = client;
        // initialize service stub.
        ChatStub stub = new;
        stub.initStub(client);
        self.stub = stub;
    }
    public function getCallerActions() returns (ChatStub) {
        return self.stub;
    }
};

type ChatMsg {
    string name;
    string message;
};

//Meta data of the service definition
@final string DESCRIPTOR_KEY = "Chat.proto";
map descriptorMap =
{
    "Chat.proto":
    "0A0A436861742E70726F746F1A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F22370A07436861744D736712120A046E616D6518012001280952046E616D6512180A076D65737361676518022001280952076D657373616765323A0A044368617412320A046368617412082E436861744D73671A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756528013001620670726F746F33"
    ,

    "google.protobuf.wrappers.proto":
    "0A0E77726170706572732E70726F746F120F676F6F676C652E70726F746F62756622230A0B446F75626C6556616C756512140A0576616C7565180120012801520576616C756522220A0A466C6F617456616C756512140A0576616C7565180120012802520576616C756522220A0A496E74363456616C756512140A0576616C7565180120012803520576616C756522230A0B55496E74363456616C756512140A0576616C7565180120012804520576616C756522220A0A496E74333256616C756512140A0576616C7565180120012805520576616C756522230A0B55496E74333256616C756512140A0576616C756518012001280D520576616C756522210A09426F6F6C56616C756512140A0576616C7565180120012808520576616C756522230A0B537472696E6756616C756512140A0576616C7565180120012809520576616C756522220A0A427974657356616C756512140A0576616C756518012001280C520576616C756542570A13636F6D2E676F6F676C652E70726F746F627566420D577261707065727350726F746F50015A057479706573F80101A20203475042AA021E476F6F676C652E50726F746F6275662E57656C6C4B6E6F776E5479706573620670726F746F33"

};
