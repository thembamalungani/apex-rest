/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is the http response class
 * @date 2019-09-07
 */
global virtual class HttpResponse {

    /**
     * The http code
     *
     * @param Integer code
     */ 
    private Integer code;

    /**
     * The response headers
     *
     * @param Map<String, String>
     */ 
    private Map<String, String> headers;

    /**
     * The response body
     * 
     * @param String data
     */ 
    protected String data;
    
    /**
     * HttpResponse default constructor
     */
    public HttpResponse() {

        this.headers = new Map<String, String>();
        this.code = -1;
        this.data = '';
    }

    /**
     * Check if the requests was successful or not
     *
     * @return Boolean
     */
    public virtual Boolean isSuccess() {

        return (this.code >= 400);
    }

    /**
     * Get the http code
     *
     * @return Integer
     */ 
    public Integer getCode() {

        return this.code;
    }

    /**
     * Gets the data
     *
     * @return String
     */ 
    public String getData() {

        return this.data;
    }

    /**
     * Get the headers
     *
     * @return String
     */
    public Map<String, String> getHeaders() {

        return this.headers;
    }

    /**
     * Sets the http code
     *
     * @param Integer
     *
     * @return HttpResponse
     */ 
    public HttpResponse setCode(Integer code) {
        
        this.code = code;

        return this;
    }

    /**
     * Sets the data
     *
     * @param  String data
     *
     * @return HttpResponse
     */ 
    public HttpResponse setData(String data) {
        
        this.data = data;

        return this;
    }

    /**
     * Sets a header
     *
     * @param  String name
     * @param  String name
     *
     * @return HttpResponse
     */ 
    public HttpResponse setHeader(String name, String value) {
        
        this.headers.put(name, value);

        return this;
    }


    /**
     * Sets the headers
     *
     * @param  Map<String, String> headers
     *
     * @return HttpResponse
     */ 
    public HttpResponse setHeaders(Map<String, String> headers) {
        
        this.headers.putAll(headers);

        return this;
    }
}
