/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is the http request class
 * @date 2019-09-07
 */
public virtual class HttpRequest {

    /**
     * The http method
     *
     * @param String method
     */ 
    protected final String method  { get; }

    /**
     * The response headers
     *
     * @param Map<String, String>
     */ 
    protected final Map<String, String> headers  { get; }

    /**
     * The request body
     * 
     * @param String body
     */ 
    protected final String body  { get; }

    /**
     * The request requestUri
     * 
     * @param String requestUri
     */ 
    protected final String requestUri  { get; }
    
    /**
     * The request remoteAddress
     * 
     * @param String remoteAddress
     */ 
    protected final String remoteAddress { get; }

    /**
     * The request params
     * 
     * @param Map<String, String> params
     */
    protected final Map<String, String> params  { get; }

    /**
     * The resource path
     * 
     */
    protected public String resourcePath  { get; }

    /**
     * Default constructor
     */
    public HttpRequest() {}

    /**
     * @param Builder builer
     */
    public HttpRequest(RestRequest restRequest) {

        this.method = restRequest.httpMethod;
        this.body = restRequest.requestBody;
        this.headers = restRequest.headers;
        this.requestUri = restRequest.requestURI;
        this.remoteAddress = restRequest.remoteAddress;
        this.resourcePath = restRequest.resourcePath;
        this.params = restRequest.params;
    }

    /**
     * Creates a HttpRequest from RestRequest
     *
     * @param RestRequest restRequest
     * @return HttpRequest
     */
    public static HttpRequest fromContext(RestRequest restRequest) {

        return new HttpRequest(restRequest);
    }
}
