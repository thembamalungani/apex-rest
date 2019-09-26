/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is the base http method handler used if non defined
 * @datet 2019-09-07
 */
public abstract class BaseHttpMethodHandler implements IHttpMethodHandler {
    
    /**
     * BaseHttpMethodHandler default constructor
     */
    public BaseHttpMethodHandler() {}

    /**
     * Called when the request is done processing
     *
     * @param HttpRequest request
     * @param HttpResponse response
     */
    public virtual void complete(HttpRequest request, HttpResponse response) {}

    /**
     * Called when the request failed processing
     *
     * @param HttpRequest request
     * @param HttpResponse response
     */
    public virtual void fail(HttpRequest request, HttpResponse response) {}
}
