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
    public final String method  { private set; }

    /**
     * The response headers
     *
     * @param Map<String, String>
     */ 
    public final Map<String, String> headers  { private set; }

    /**
     * The request body
     * 
     * @param Blob body
     */ 
    public final Blob body  { private set; }

    /**
     * The request requestUri
     * 
     * @param String requestUri
     */ 
    public final String requestUri  { private set; }
    
    /**
     * The request remoteAddress
     * 
     * @param String remoteAddress
     */ 
    public final String remoteAddress { private set; }

    /**
     * The request params
     * 
     * @param Map<String, String> params
     */
    public final Map<String, String> params  { private set; }

    /**
     * The resource path
     * 
     */
    public final String resourcePath  { private set; }

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
